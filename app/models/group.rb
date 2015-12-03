# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  topic      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :students, through: :user_groups
  has_many :teachers, through: :user_groups
  has_many :resources
  validates :topic, presence: true

end
