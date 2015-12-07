class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def create
    @video = Video.new(video_params)
    binding.pry
    if @video.save
      current_user.videos << @video
      redirect_to videos_path(@videos)
    else
      render partial: 'videos/form'
    end
  end

  private

  def video_params
    params.require(:video).permit(:link, :group_id)
  end
end
