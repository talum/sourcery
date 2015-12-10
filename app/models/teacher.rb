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
  belongs_to :user
  has_many :groups, through: :user

  def students
    array = self.groups.each_with_object([]) do |group, array_obj|
      array_obj.push(group.users.where.not(id: self.id))
    end.flatten.uniq
    array.delete_if do |user|
      (user.teacher)
    end
  end

  def student_comments
    self.students.each_with_object([]) do |student, array|
      array << {name: student.gmail_name, comment_count: student.comments.length, object: student}
    end.sort_by { |hash| hash[:comment_count]}.reverse
  end

  def top_student_commenter
    if self.student_comments.length > 0
      student = self.student_comments.first[:object]
      {student: student, num_comments: student.comments.length}
    else
      []
    end
  end

  def student_resources
    self.students.each_with_object([]) do |student, array|
      array << {student: student.gmail_name, resource_count: student.resources.length, object: student}
    end.sort_by {|hash| hash[:resource_count]}.reverse
  end

  def top_student_contributor
    if self.student_resources.length > 0
      student = self.student_resources.first[:object]
      {student: student, num_resources: student.resources.length}
    else
      []
    end
  end



end
