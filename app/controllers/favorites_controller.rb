class FavoritesController < ApplicationController
  def index
    # @favorites = current_user.favorites
    @favorites_by_group = current_user.favorites_by_group
  end
end