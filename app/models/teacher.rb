# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Teacher < ActiveRecord::Base
  has_many :groups
  belongs_to :user
end
