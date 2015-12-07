class TeachersController < ApplicationController

  def show
    respond_to do |format| 
      format.html
      format.json {render json: {studentData: Student.number_of_comments_by_student}}
    end
  end 

end 