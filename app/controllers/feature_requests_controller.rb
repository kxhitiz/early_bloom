class FeatureRequestsController < ApplicationController
  before_action :require_login, only: [:vote]

  def index
    @feature_requests = FeatureRequest.includes(:user).popular
    @new_feature_request = FeatureRequest.new
  end

  def create
    @feature_request = FeatureRequest.new(feature_request_params)
    @feature_request.user = current_user if logged_in?

    if @feature_request.save
      redirect_to feature_requests_path, notice: "Thanks for your suggestion!"
    else
      @feature_requests = FeatureRequest.includes(:user).popular
      @new_feature_request = @feature_request
      render :index, status: :unprocessable_entity
    end
  end

  def vote
    @feature_request = FeatureRequest.find(params[:id])

    if @feature_request.voted_by?(current_user)
      @feature_request.feature_votes.find_by(user: current_user).destroy
    else
      @feature_request.feature_votes.create(user: current_user)
    end

    redirect_to feature_requests_path
  end

  private

  def feature_request_params
    params.require(:feature_request).permit(:title, :description, :guest_name, :guest_email)
  end
end
