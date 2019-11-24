class UsersControllerController < ApplicationController
 before_action :set_user

  def show
    @groups = Group.where(user: current_user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to my_account_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end

  def set_user
    @user = current_user
  end
end
