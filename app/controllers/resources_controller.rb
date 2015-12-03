class ResourcesController < ApplicationController
  def index
    @resources_by_group = current_user.resources_by_group
  end

  def show
    @resource = Resource.find(params[:id])
    @comment = Comment.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    if @resource.save
      redirect_to @resource
    else
      @group = Group.find(resource_params[:group_id])
      render 'groups/show'
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
    # @resource = Resource.find(params[:resource])
    Favorite.find_or_create_by(user_id: current_user.id, resource_id: params[:resource])
    redirect_to :back
  end

private
  def resource_params
    params.require(:resource).permit(:title, :link, :group_id)
  end

end