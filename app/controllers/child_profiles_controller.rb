class ChildProfilesController < ApplicationController
  before_action :require_login

  def new
    @child_profile = current_user.child_profiles.build
  end

  def create
    @child_profile = current_user.child_profiles.build(child_profile_params)
    
    if @child_profile.save
      redirect_to root_path, notice: "Child profile created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child_profile = current_user.child_profiles.find(params[:id])
  end

  def update
    @child_profile = current_user.child_profiles.find(params[:id])

    if @child_profile.update(child_profile_params)
      redirect_to user_path(current_user), notice: "Child profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child_profile = current_user.child_profiles.find(params[:id])
    @child_profile.destroy
    redirect_to user_path(current_user), notice: "Child profile deleted."
  end

  private

  def child_profile_params
    params.require(:child_profile).permit(:name, :birth_date)
  end
end
