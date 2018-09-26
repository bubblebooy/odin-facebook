class LikesController < ApplicationController
  def create
    like = current_user.likes.build(post_id: params[:id]).save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.where(post_id: params[:id]).find_by(user: current_user).destroy
    redirect_back(fallback_location: root_path)
  end
end
