class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @resource = Resource.find(comment_params[:resource_id])
    if @comment.save
      redirect_to @resource
    else
      render 'resources/show'
    end
  end

  def destroy

  end

private 
  def comment_params
    params.require(:comment).permit(:content, :user_id, :resource_id)
  end

end