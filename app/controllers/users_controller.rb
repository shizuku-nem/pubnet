class UsersController < ApplicationController
  def index
    if !current_user || !current_user.is_admin
      redirect_to root_path
    end
    @users = User.all
  end
  def show
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to users_path, notice: "User deleted."
    end
  end
  def edit
    puts "params: #{params}"
    @user = User.find(params[:id])
    @user.update(is_admin: !@user.is_admin)
    @user.save(:validate => false)
    redirect_to users_path
  end

  private
    def user_create_params
      params.require(:user).permit(:name, :gender, :game_id, :email, :age)
    end
end

  