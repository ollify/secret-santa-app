class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    if @group.save
      @user.group_id = @group.id
      @user.admin = true
      @user.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
