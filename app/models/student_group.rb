# == Schema Information
#
# Table name: student_groups
#
#  id         :integer          not null, primary key
#  student_id :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentGroup < ActiveRecord::Base
  belongs_to :student
  belongs_to :group
end
