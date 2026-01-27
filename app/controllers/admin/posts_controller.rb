class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.includes(:user, :child_profile, :category)
                 .order(created_at: :desc)
                 .page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "Post deleted successfully."
  end
end
