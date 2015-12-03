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
  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :favorites
  validates :title, presence: true
  validates :link, presence: true
  
end
