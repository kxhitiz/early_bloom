class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_child_profile, only: [:new, :create]

  def index
    @categories = Category.all
    @current_category = find_category
    @current_post_type = params[:post_type]

    @posts = Post.published.includes(:user, :child_profile, :reactions, :category)
    @posts = @posts.where(category_id: @current_category.id) if @current_category
    @posts = @posts.where(post_type: params[:post_type]) if params[:post_type].present?
    @posts = @posts.page(params[:page])
  end

  def feed
    return unless require_login
    return unless require_child_profile

    @child_profile = current_user.child_profiles.first
    @posts = FeedBuilder.new(@child_profile).posts.page(params[:page])

    render :index
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).recent
  end

  def new
    @post = current_user.posts.build
    @child_profiles = current_user.child_profiles
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.publish!

    if @post.save
      redirect_to @post, notice: "Post created successfully!"
    else
      @child_profiles = current_user.child_profiles
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @child_profiles = current_user.child_profiles
    @categories = Category.all
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully!"
    else
      @child_profiles = current_user.child_profiles
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to feed_path, notice: "Post deleted successfully."
  end

  private

  def find_category
    return nil unless params[:category].present?

    if params[:category].to_s.match?(/^\d+$/)
      Category.find_by(id: params[:category])
    else
      Category.find_by_slug(params[:category])
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_type, :child_profile_id, :category_id)
  end
end
