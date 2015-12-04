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
  has_many :resources
  has_many :favorites, through: :resources
  validates :topic, presence: true

end
