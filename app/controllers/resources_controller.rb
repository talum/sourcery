class ResourcesController < ApplicationController
  before_action :login_required
  
  def index
    @resources_by_group = current_user.resources_by_group
  end

  def show
    @resource = Resource.find(params[:id])
    @comment = Comment.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to @resource
    else
      @group = Group.find(resource_params[:group_id])
      redirect_to group_path(@group)
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)
    redirect_to @resource
  end

  def destroy
    @resource = Resource.find(params[:id])
    @group = @resource.group
    @resource.destroy
    redirect_to @group
  end

  def favorite
    @resource = Resource.find(params[:resource])
    @favorite = Favorite.find_or_create_by(user_id: current_user.id, resource_id: params[:resource])
    @resource.create_activity :favorite
    redirect_to :back
  end

  def unfavorite
    # @resource = Resource.find(params[:resource])
    @favorite = Favorite.find_by(user_id: current_user.id, resource_id: params[:resource])
    @favorite.destroy
    redirect_to :back
  end

private
  def resource_params
    params.require(:resource).permit(:title, :link, :group_id, :user_id)
  end


end