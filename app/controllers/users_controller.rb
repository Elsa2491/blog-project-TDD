class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Hello #{@user.nickname}"
      redirect_to @user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                :nickname, :email, :password,
                                :password_confirmation)
  end
end
