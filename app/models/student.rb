# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, through: :student_groups
  belongs_to :user
end
