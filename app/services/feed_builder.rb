class FeedBuilder
  DEFAULT_AGE_RANGE_MONTHS = 3

  def initialize(child_profile, age_range: DEFAULT_AGE_RANGE_MONTHS)
    @child_profile = child_profile
    @age_range = age_range
  end

  def posts
    return Post.none unless @child_profile

    age_in_months = @child_profile.age_in_months
    min_age = [age_in_months - @age_range, 0].max
    max_age = age_in_months + @age_range

    Post.published
        .joins(:child_profile)
        .where(age_calculation_sql, min_age, max_age)
        .includes(:user, :child_profile, :reactions, :comments, :category)
        .order(published_at: :desc)
  end

  private

  def age_calculation_sql
    <<~SQL
      (
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, child_profiles.birth_date)) * 12 + 
        EXTRACT(MONTH FROM AGE(CURRENT_DATE, child_profiles.birth_date))
      ) BETWEEN ? AND ?
    SQL
  end
end
