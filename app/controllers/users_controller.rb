class UsersController < ApplicationController
  def show
    @groups = current_user.groups
  end

  def groups
    render 'groups'
  end

end