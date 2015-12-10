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

class GoogleDoc < ActiveRecord::Base
  belongs_to :group
  validates :title, presence: true
end
