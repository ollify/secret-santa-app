class GroupsController < ApplicationController
  before_action :authenticate_user!

  def join_group
    @user = current_user
    @group = Group.find(params[:group_id])
    @group.save
    @user.group_id = @group.id
    @user.user_status = 'pending'
    if @user.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def approve_request
    @group = Group.find(params[:group_id])
    requesting_user = User.find(params[:user_id])
    requesting_user.user_status = 'approved'
    if requesting_user.save
      mail = UserMailer.with(user: requesting_user).approval_confirmation
      mail.deliver_now
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def decline_request
    @group = Group.find(params[:group_id])
    requesting_user = User.find(params[:user_id])
    requesting_user.user_status = 'declined'
    requesting_user.group_id = nil
    if requesting_user.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def white_label_user
    @group = Group.find(params[:group_id])
    requesting_user = User.find(params[:user_id])
    requesting_user.user_status = 'created'
    if requesting_user.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def draw
    @group = Group.find(params[:group_id])
    @participants = @group.users
    @group_arr = []
    @participants.each do |participant|
      @group_arr << participant if participant.user_status == 'approved'
    end
    @group_arr.shuffle!
    @group_arr.each_with_index do |person, index|
      person.receiver_id = @group_arr[index - 1].id
      person.save
    end
    @group.status = "drawn"
    @group.save
    redirect_to group_path(@group)
  end

  def undo_draw
    @group = Group.find(params[:group_id])
    @participants = @group.users
    @participants.each do |user|
      user.receiver_id = nil
      user.save
    end
    @group.status = 'created'
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def send_receiver
    @group = Group.find(params[:group_id])
    @participants = @group.users
    @participants.each do |person|
      if person.user_status == 'approved' && @group.status == 'drawn'
        mail = UserMailer.with(user: person).draw_confirmation
        mail.deliver_now
      end
    end
  end

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
    @group.status = 'created'
    if @group.save
      @user.group_id = @group.id
      @user.admin = true
      @user.user_status = 'approved'
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
    params.require(:group).permit(:name, :user, :photo, :description)
  end
end
