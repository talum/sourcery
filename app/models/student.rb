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
  has_many :resources, through: :user

  ###########
  #COMMENTS#
  ##########

  #Helper Method:
  def self.array_of_num_comments_by_student 
    joins(:comments).group('students.id').count.sort_by{|k, v| v}.reverse
  end

  #Array of hashes that include a student *object* and number of comments they have made:
  def self.order_by_comments_object
    self.array_of_num_comments_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first), comment_count: student_array.last}
    end
  end

  #Array of hashes that include a student's *name* and number of comments they have made:
  def self.order_by_comments_name
    self.array_of_num_comments_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {name: Student.find(student_array.first).user.gmail_name, comment_count: student_array.last}
    end
  end

  #return the student object who has commented the most
  def self.with_most_comments
    if self.array_of_num_comments_by_student.length > 0 && self.array_of_num_comments_by_student.length > 0
      {student: Student.find(self.array_of_num_comments_by_student.first.first), num_comments: self.array_of_num_comments_by_student.first.last}
    else
      []
    end
  end

  def average_comment_length
    counter = 0
    self.comments.each do |comment|
      array_of_words = comment.content.split(" ")
      counter += array_of_words.length
    end 
    (counter / self.comments.length) if self.comments.length > 0
  end

  ###########
  #RESOURCES#
  ###########

  #Helper Method:
  def self.array_of_num_of_resources_by_student
    joins(:resources).group('students.id').count.sort_by{|k, v| v}.reverse
  end

  #Array of hashes that include a student *object* and number of resources they have made:
  def self.order_by_resources_object
    self.array_of_num_of_resources_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first), resource_count: student_array.last}
    end
  end

  #Array of hashes that include a student's *name* and number of resources they have made:
  def self.order_by_resources_name
    self.array_of_num_of_resources_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first).user.gmail_name, resource_count: student_array.last}
    end
  end

  #Returns the student object who has made the most resources
  def self.with_most_resources
    if self.array_of_num_of_resources_by_student.length > 0 && self.array_of_num_of_resources_by_student.length > 0
    {student: Student.find(self.array_of_num_of_resources_by_student.first.first), num_resources: self.array_of_num_of_resources_by_student.first.last}
    else
      []
    end
  end

end
