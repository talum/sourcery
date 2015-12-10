class FavoritesController < ApplicationController
  def index
    @favorites_by_group = current_user.favorites_by_group
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @favorite = Favorite.find_or_create_by(user_id: current_user.id, resource_id: params[:resource_id])
    @resource.create_activity :favorite
    unfavorite_button = render_to_string(partial: 'resources/unfavorite_resource', locals: {resource: @resource})
    favorites_message = @resource.likes_message(current_user)
    render json: {unfavorite_button: unfavorite_button, favorites_message: favorites_message}
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @resource = @favorite.resource
    @favorite.destroy
    favorite_button = render_to_string(partial: 'resources/favorite_resource', locals: {resource: @resource})
    favorites_message = @resource.likes_message(current_user)
    render json: {favorite_button: favorite_button, favorites_message: favorites_message}
  end

end