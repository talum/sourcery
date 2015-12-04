class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.sign_in_count > 0
      redirect_to root_path
    else
      render '/sessions/_teacher_student_form.html'
    end 
  end

  def choice
    if params[:choice] == "Teacher"
      Teacher.create(user_id: current_user.id )
    else
      Student.create(user_id: current_user.id )
    end
    redirect_to root_path
  end

  def destroy
    @user = current_user
    # @user.sign_in_count += 1
    # @user.save
    session[:user_id] = nil
    redirect_to root_path
  end
end