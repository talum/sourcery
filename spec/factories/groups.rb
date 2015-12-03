# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  topic      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :group do
    topic "magicking"
    
  end

end
