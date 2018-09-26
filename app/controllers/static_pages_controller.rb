class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @posts = Post.where(user_id:  current_user.friends).or(Post.where(user_id:  current_user)).paginate(page: params[:posts_page], per_page: 5)
      @friends = current_user.friends.paginate(page: params[:friends_page], per_page: 15)
    end
  end
end
