class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def changeRole
    @user = User.find(params[:id])
    @user.update(is_admin: !@user.is_admin)
    redirect_to users_index_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to users_index_path, notice: "User deleted."
    end
  end
end

  