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
      array.sort! {|a,b| b[:comment_count] <=> a[:comment_count] }
    end
  end

  def self.max_comments_by_student
    self.number_of_comments_by_student.first
  end

  def self.number_of_resources_by_student
    self.all.each_with_object([]) do |student, array|
      resource_count = student.resources.count
      array << {name: student.user.gmail_name, resource_count: resource_count}
      array.sort! {|a,b| b[:resource_count] <=> a[:resource_count] }
    end
  end

  def self.max_resources_by_student
    self.number_of_resources_by_student.first
  end

  def average_comment_length
    counter = 0
    self.comments.each do |comment|
      array_of_words = comment.content.split(" ")
      counter += array_of_words.length
    end 
    counter / self.comments.length
  end 
   

  


end
