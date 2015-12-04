# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  resource_id :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: :create, owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  belongs_to :user
  belongs_to :resource

  validates :content, presence: true
  
end
