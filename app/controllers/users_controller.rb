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
    if !@group.users.include? current_user
      @group.users << current_user
    end   
    redirect_to groups_path
  end

  def leave_group
    @group = Group.find(join_params)
    #remove current_user from group/remove group from current_user
    @group.users.delete(current_user)
    @group.save
    redirect_to groups_path
  end

private
  def join_params
    params.require(:group_id)
  end

end