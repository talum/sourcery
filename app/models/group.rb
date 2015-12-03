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
  belongs_to :teacher
  has_many :student_groups
  has_many :students, through: :student_groups
  has_many :resources
  validates :topic, presence: true

end
