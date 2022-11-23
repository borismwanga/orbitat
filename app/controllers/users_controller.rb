class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :space_driving_license)
  end

end
