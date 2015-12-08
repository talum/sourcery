# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  link         :string
#  title        :string
#  published_at :datetime
#  likes        :integer
#  dislikes     :integer
#  uid          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  group_id     :integer
#  user_id      :integer
#

FactoryGirl.define do
  factory :video do
    link "MyString"
title "MyString"
published_at "2015-12-06 15:41:17"
likes 1
dislikes 1
uid "MyString"
  end

end
