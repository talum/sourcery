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

class GoogleDoc < ActiveRecord::Base
  belongs_to :group
end
