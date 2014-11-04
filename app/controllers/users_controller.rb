class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_user
  end

  def show
    set_user
  end

  def destroy
    set_user
    @user.destroy
    redirect_to users_path, notice: "User was succesfully deleted"
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                  :password,:password_confirmation
                                )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
