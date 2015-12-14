class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      video_item = render_to_string(partial: 'videos/video', locals: {video: @video})
      render json: {video_item: video_item}
    else
      render json: {errors: @video.errors.full_messages}, status: 422
    end 
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    render json: {message: "destroyed"}
  end 

  private

  def video_params
    params.require(:video).permit(:link, :group_id, :user_id)
  end
end
