class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @resource = Resource.new
  end

  def index
    @groups = Group.all
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
    binding.pry
    #use current_user
    # if current_user.teacher
    #   current_user.id = @group.teacher_id
    # elsif current_user.student
    #   current_user.id = @group.students.find(params[:id])
    # end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)    
    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:topic, :teacher_id)
  end


end