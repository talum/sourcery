class UsersController < ApplicationController
  before_action :login_required, except: [:omniauth_failure]
  def show
    @user = User.find(params[:id])
    load_activities
  end

  def index
    @users = User.where.not(id: current_user.friends_and_self_ids)
  end

  def groups
    @groups = current_user.groups
    render 'groups'
  end

  def omniauth_failure
    redirect_to root_url
  end

private

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').where(owner_id: current_user.fellow_group_member_ids).limit(20)
  end

end