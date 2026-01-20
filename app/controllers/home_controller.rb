class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to feed_path if current_user.child_profiles.any?
    end
    
    @recent_posts = Post.published.includes(:user, :child_profile, :category).limit(5)
  end
end
