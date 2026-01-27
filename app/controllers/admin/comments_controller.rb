class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.includes(:user, :post)
                       .order(created_at: :desc)
                       .page(params[:page])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: "Comment deleted successfully."
  end
end
