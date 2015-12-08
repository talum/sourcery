# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  group_id    :integer
#  sender_name :string
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :notification do
    user_id 1
group_id 1
sender_name "MyString"
content "MyString"
  end

end
