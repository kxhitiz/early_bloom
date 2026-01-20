class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.published.includes(:child_profile, :reactions).order(published_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio)
  end
end
