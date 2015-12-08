class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    @video.save
    # if @video.save
    #   redirect_to videos_path(@videos)
    # else
    #   render partial: 'videos/form'
    # end
    respond_to do |format|
      format.js { render action: '../groups/show', status: :created, location: @video}
    end
  end

  private

  def video_params
    params.require(:video).permit(:link, :group_id)
  end
end
