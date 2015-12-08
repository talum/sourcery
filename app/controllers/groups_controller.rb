class GroupsController < ApplicationController
  before_action :login_required

  def show
    @group = Group.find(params[:id])
    @resource = Resource.new
    @google_doc = GoogleDoc.new
    @video = Video.new
    @notification = Notification.new
    @invite_list = User.where.not(id: things)
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save!
    current_user.groups << @group
    redirect_to group_path(@group)
    rescue ActiveRecord::RecordInvalid
      render 'new'
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)    
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:topic, :description)
  end

end