# == Schema Information
#
# Table name: google_docs
#
#  id       :integer          not null, primary key
#  title    :string
#  url      :string
#  doc_type :string
#  group_id :integer
#

FactoryGirl.define do
  factory :google_doc do
    title ""
url ""
type ""
  end

end
