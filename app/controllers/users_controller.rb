class UsersController < ApplicationController
  def show
    @groups = current_user.groups
  end

  def groups
    @groups = current_user.groups
    render 'groups'
  end

  def join_group
    @group = Group.find(join_params)
    if current_user.student
      @group.students << current_user.student
    else
      @group.teacher = current_user.teacher
    end
    redirect_to groups_path
  end

  def leave_group
  end

private
  def join_params
    params.require(:group_id)
  end

end