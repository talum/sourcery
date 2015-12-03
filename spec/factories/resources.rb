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

FactoryGirl.define do
  factory :resource do
    title "hellooo sorcery"
    link "http://harrypotter.com"
    association :comment, factory: :comment
        
  end

end
