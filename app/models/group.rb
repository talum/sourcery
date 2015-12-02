class Group < ActiveRecord::Base
  belongs_to :teacher
  has_many :student_groups
  has_many :students, through: :student_groups
  has_many :resources
end
