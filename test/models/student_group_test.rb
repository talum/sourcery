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

require 'test_helper'

class StudentGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
