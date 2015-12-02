class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
  end

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group
    else
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:topic, :teacher_id)
  end


end