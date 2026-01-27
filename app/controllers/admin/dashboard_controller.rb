class Admin::DashboardController < Admin::BaseController
  def index
    @stats = {
      users: User.count,
      posts: Post.count,
      comments: Comment.count,
      reactions: Reaction.count
    }

    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_posts = Post.includes(:user).order(created_at: :desc).limit(5)
    @recent_comments = Comment.includes(:user, :post).order(created_at: :desc).limit(5)

    # Daily stats for the selected period
    @period = (params[:period] || 14).to_i
    @period = 14 unless [7, 14, 30, 90].include?(@period)
    @daily_stats = build_daily_stats(@period)
  end

  private

  def build_daily_stats(days)
    end_date = Date.current
    start_date = end_date - (days - 1).days
    date_range = start_date..end_date

    users_by_day = User.where(created_at: date_range.first.beginning_of_day..date_range.last.end_of_day)
                       .group("DATE(created_at)")
                       .count

    posts_by_day = Post.where(created_at: date_range.first.beginning_of_day..date_range.last.end_of_day)
                       .group("DATE(created_at)")
                       .count

    comments_by_day = Comment.where(created_at: date_range.first.beginning_of_day..date_range.last.end_of_day)
                             .group("DATE(created_at)")
                             .count

    {
      labels: date_range.map { |d| d.strftime("%b %d") },
      users: date_range.map { |d| users_by_day[d] || 0 },
      posts: date_range.map { |d| posts_by_day[d] || 0 },
      comments: date_range.map { |d| comments_by_day[d] || 0 }
    }
  end
end
