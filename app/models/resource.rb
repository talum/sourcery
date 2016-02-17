# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  title      :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Resource < ActiveRecord::Base
  require 'uri'
  include PublicActivity::Model
  tracked only: :create, owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }


  belongs_to :group
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :link, presence: true
  validates :link, :format => URI::regexp(%w(http https))

  def self.most_popular_resource_by_comments
    self.joins(:comments).select('resources.*, COUNT(comments.id) as comment_count').group('resources.id').order('comment_count DESC').limit(10)
  end

  def self.most_popular_resource_by_comments_with_count
    self.most_popular_resource_by_comments.each_with_object([]) do |resource, array|
      array.push(title: resource.title, count: resource.comments.count)
    end
  end

  def self.most_popular_resource_by_favorites
    self.joins(:favorites).select('resources.*, COUNT(favorites.id) as favorite_count').group('resources.id').order('favorite_count DESC').limit(10)
  end

  def self.most_popular_resource_by_favorites_with_count
    self.most_popular_resource_by_favorites.each_with_object([]) do |resource, array|
      array.push(title: resource.title, count: resource.favorites.count)
    end
  end

  def likes_message(user)
    if !user_liked?(user)
      if self.favorites.count == 1
        "<strong>1 person</strong> has favorited this resource".html_safe
      else
        "<strong>#{self.favorites.count} people</strong> have favorited this resource".html_safe
      end
    else
      if (self.favorites.count - 1) == 1
        "<strong>You</strong> and <strong>1 other person</strong> have favorited this resource".html_safe
      else
        "<strong>You</strong> and <strong>#{self.favorites.count - 1} other people</strong> have favorited this resource".html_safe
      end
    end
  end

  private
  def user_liked?(user)
    self.favorites.where(user_id: user.id).any?
  end
  
 end