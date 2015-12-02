class UsersController < ApplicationController
  def show
    binding.pry
    @groups = current_user.groups
  end
end