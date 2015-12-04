class FavoriteToggle 
  attr_reader :resource, :current_user

  def initialize(resource, current_user)
    @resource = resource
    @current_user = current_user
  end

  def already_favorited?
    if Favorite.find_by(user_id: current_user.id, resource_id: resource.id)
      'unfavorite_resource'
    else
      'favorite_resource'
    end
  end

end