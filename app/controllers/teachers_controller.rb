class TeachersController < ApplicationController

  def show
    respond_to do |format| 
      format.html
      format.json {render json: {studentData: Student.order_by_comments_name}}
    end
  end 

end 