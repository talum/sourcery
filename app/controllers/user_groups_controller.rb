class UserGroupsController < ApplicationController

  def create
    @group = Group.find(join_params)
    @group.add_member(current_user)
    @group.create_activity :join  
    redirect_to @group    
  end

  def destroy
    @user_group = UserGroup.find(params[:id])
    @group = @user_group.group
    @user_group.destroy
    @group.create_activity :leave
    @group.save
    redirect_to groups_path
  end

  private

  def join_params
    params.require(:group_id)
  end

end