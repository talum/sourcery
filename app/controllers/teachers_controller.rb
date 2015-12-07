class TeachersController < ApplicationController

  def show
    @top_commenter = Student.with_most_comments
    respond_to do |format| 
      format.html
      format.json {render json: {studentData: Student.order_by_comments_name}}
    end
  end 

end 