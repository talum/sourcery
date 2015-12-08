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

class Notification < ActiveRecord::Base
  belongs_to :user 
  belongs_to :group 
end
