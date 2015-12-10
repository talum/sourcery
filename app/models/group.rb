# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  topic       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Group < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: :create, owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :students, through: :users
  has_many :teachers, through: :users
  has_many :comments, through: :resources
  has_many :resources
  has_many :google_docs
  has_many :videos
  has_many :favorites, through: :resources
  has_many :notifications
  validates :topic, presence: true

  def self.most_resources
    self.joins(:resources).select('groups.*, COUNT(resources.id) as resources_count').group('groups.id').order('resources_count DESC').limit(10)
  end

  def comments_over_time
    comments_over_time_hash = comments.group_by{|comment| comment.created_at.to_date.to_s }
    comments_over_time_array = comments_over_time_hash.map{|k,v| [k, v.length]}
    comments_over_time_array.push([self.created_at.to_date.to_s, 0])
    return comments_over_time_array
  end

  def add_member(user)
    if !self.users.include?(user)
      self.users << user 
    end
  end

  def remove_member(user)
    self.users.delete(user) if self.users.include?(user)
  end

  def members
    self.users.each_with_object([]) do |user, array|
      array << {name: user.gmail_name, email: user.email}
    end  
  end 

  def invite_ids(current_user)
    nonmembers = UserGroup.where.not(group_id: self.id).pluck(:user_id)
    nonmembers.select{|id| current_user.friend_ids.include?(id)}
  end




end
