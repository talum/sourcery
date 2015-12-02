class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])
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

private
  def resource_params
    params.require(:resource).permit(:title, :link, :group_id)
  end

end