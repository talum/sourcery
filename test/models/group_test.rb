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

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
