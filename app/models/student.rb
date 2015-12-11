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

  def self.array_of_num_comments_by_student 
    joins(:comments).group('students.id').count.sort_by{|k, v| v}.reverse
  end

  def self.order_by_comments_object
    self.array_of_num_comments_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first), comment_count: student_array.last}
    end
  end

  def self.order_by_comments_name
    self.array_of_num_comments_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {name: Student.find(student_array.first).user.gmail_name, comment_count: student_array.last}
    end
  end

  def self.comments_by_student_for_a_teacher(teacher)
    student_ids = teacher.groups.each_with_object([]) do |group, my_groups_student_ids|
      my_groups_student_ids.push(group.user_ids)
    end.flatten.uniq.delete(teacher.id)

    self.where(user_id: student_ids).each_with_object([]) do |student, array_object|
      array_object << {name: student.gmail_name, comment_count: student.comments.length}
    end
  end

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

  def self.array_of_num_of_resources_by_student
    joins(:resources).group('students.id').count.sort_by{|k, v| v}.reverse
  end

  def self.order_by_resources_object
    self.array_of_num_of_resources_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first), resource_count: student_array.last}
    end
  end

  def self.order_by_resources_name
    self.array_of_num_of_resources_by_student.each_with_object([]) do |student_array, array_object|
      array_object << {student: Student.find(student_array.first).user.gmail_name, resource_count: student_array.last}
    end
  end

  def self.resources_by_student_for_a_teacher(teacher)
    student_ids = teacher.groups.each_with_object([]) do |group, my_groups_student_ids|
      my_groups_student_ids.push(group.user_ids)
    end.flatten.uniq.delete(teacher.id)

    array = self.where(user_id: student_ids).each_with_object([]) do |student, array_object|
      array_object << {name: student.gmail_name, resource_count: student.resources.length}
    end
    array
  end

  def self.with_most_resources
    if self.array_of_num_of_resources_by_student.length > 0 && self.array_of_num_of_resources_by_student.length > 0
    {student: Student.find(self.array_of_num_of_resources_by_student.first.first), num_resources: self.array_of_num_of_resources_by_student.first.last}
    else
      []
    end
  end

end
