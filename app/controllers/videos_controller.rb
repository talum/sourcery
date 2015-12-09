class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @video.save
    video_item = render_to_string(partial: 'videos/video', locals: {video: @video})
    render json: {video_item: video_item}
  end

  private

  def video_params
    params.require(:video).permit(:link, :group_id, :user_id)
  end
end
