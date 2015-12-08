class TeachersController < ApplicationController

  def show
    @top_commenter = Student.with_most_comments
    @top_contributor = Student.with_most_resources
    @student_comments = Student.order_by_comments_name[0..9]
    @student_resources = Student.order_by_resources_name[0..9]
    respond_to do |format| 
      format.html
      format.json {render json: {studentCommentData: @student_comments, studentResourceData: @student_resources}}
    end
  end 

end 