class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @resource = Resource.find(comment_params[:resource_id])
    if @comment.save
      html_string = render_to_string 'comments/_comment', locals: {comment: @comment}, layout: false
      render json: {template: html_string}
    else
      render 'resources/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @resource = @comment.resource
    @comment.destroy
    redirect_to @resource

  end

private 
  def comment_params
    params.require(:comment).permit(:content, :user_id, :resource_id)
  end

end