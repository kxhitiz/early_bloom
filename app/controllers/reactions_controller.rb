class ReactionsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @reaction = @post.reactions.build(reaction_params)
    @reaction.user = current_user
    
    if @reaction.save
      redirect_to @post, notice: "Reaction added!"
    else
      redirect_to @post, alert: "Unable to add reaction"
    end
  end

  def destroy
    @reaction = current_user.reactions.find(params[:id])
    @post = @reaction.post
    @reaction.destroy
    
    redirect_to @post, notice: "Reaction removed"
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reaction_type)
  end
end
