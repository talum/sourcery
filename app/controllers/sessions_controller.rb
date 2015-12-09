class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.sign_in_count > 0
      redirect_to user_path(@user)
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
    current_user.sign_in_count += 1
    current_user.save
    redirect_to user_path(current_user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end