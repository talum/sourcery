class ResourcesController < ApplicationController
  before_action :login_required
  
  def index
    @resources_by_group = current_user.resources_by_group
  end

  def show
    @resource = Resource.find(params[:id])
    @comment = Comment.new
    @comments = @resource.comments

    respond_to do |format|
      format.html
      format.pdf do 
        pdf = CommentsPdf.new(@comments, @resource)
        send_data pdf.render, filename: 'comments.pdf', type: 'application/pdf'
      end
    end
  end

  def create
    @resource = Resource.new(resource_params)
    @group = Group.find(resource_params[:group_id])
    if @resource.save
      resource_item = render_to_string(partial: 'resources/resource', locals: {resource: @resource, current_user: current_user})
      render json: {message: "Resource saved!", resource_item: resource_item}
    else 
      render json: {errors: @resource.errors.full_messages}, status: 422
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
    redirect_to :back
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