class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, through: :student_groups
  belongs_to :user
end
