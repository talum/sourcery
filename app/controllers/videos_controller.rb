class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    # binding.pry
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to videos_path(@videos)
    else
      render partial: 'videos/form'
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
