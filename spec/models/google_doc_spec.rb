# == Schema Information
#
# Table name: google_docs
#
#  id       :integer          not null, primary key
#  title    :string
#  url      :string
#  type     :string
#  group_id :integer
#

require 'rails_helper'

RSpec.describe GoogleDoc, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
