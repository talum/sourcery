# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  belongs_to :user
  has_many :groups, through: :user
  has_many :comments, through: :user

  def self.number_of_comments_by_student
    self.all.each_with_object([]) do |student, array|
      comment_count = student.comments.count
      array << {name: student.user.gmail_name, comment_count: comment_count}
    end
  end

  


end
