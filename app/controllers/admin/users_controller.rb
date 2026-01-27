class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).limit(10)
    @comments = @user.comments.order(created_at: :desc).limit(10)
  end

  def destroy
    @user = User.find(params[:id])

    if @user == Current.user
      redirect_to admin_users_path, alert: "You cannot delete yourself."
      return
    end

    @user.destroy
    redirect_to admin_users_path, notice: "User \"#{@user.name}\" has been deleted."
  end
end
