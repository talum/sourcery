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
  tracked except: :destroy, owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }


  belongs_to :group
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :link, presence: true
  validates :link, :format => URI::regexp(%w(http https))

  def likes_message(user)
    if !user_liked?(user)
      "<strong>#{self.favorites.count} people</strong> like this resource".html_safe
    else
      "<strong>You</strong> and <strong>#{self.favorites.count - 1} other people</strong> like this resource".html_safe
    end
  end

  private
  def user_liked?(user)
    self.favorites.where(user_id: user.id).any?
  end
  
 end
