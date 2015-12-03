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

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
