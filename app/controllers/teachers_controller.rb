class TeachersController < ApplicationController
  before_action :login_required

  def show
    @top_commenter = Teacher.find_by(user_id: current_user.id).top_student_commenter
    @top_contributor = Teacher.find_by(user_id: current_user.id).top_student_contributor
    @student_comments = Teacher.find_by(user_id: current_user.id).student_comments[0..9]
    @student_resources = Teacher.find_by(user_id: current_user.id).student_resources[0..9]
    respond_to do |format| 
      format.html
      format.json {render json: {studentCommentData: @student_comments, studentResourceData: @student_resources}}
    end
  end 
end
