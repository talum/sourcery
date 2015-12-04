class UsersController < ApplicationController
  def show
    @groups = current_user.groups
    load_activities
  end

  def groups
    @groups = current_user.groups
    render 'groups'
  end

  def join_group
    @group = Group.find(join_params)
    if !@group.users.include? current_user
      @group.users << current_user
      @group.create_activity :join
    end   
    redirect_to @group
  end

  def leave_group
    @group = Group.find(join_params)
    @group.create_activity :leave
    @group.users.delete(current_user)
    @group.save
    redirect_to groups_path
  end

private
  def join_params
    params.require(:group_id)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').where(owner_id: current_user.fellow_group_member_ids).limit(20)
  end

end