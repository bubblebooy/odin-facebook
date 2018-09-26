class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_back(fallback_location: root_path, :flash => { :success => 'Friend Request Sent'})
    else
      redirect_back(fallback_location: root_path, :flash => { :warning => 'Friend Request Faild'})
    end
  end

  def update
    @friendship = Friendship.where(user_id:params[:id]).where(friend_id:current_user).first
    if @friendship.confirmed!
      current_user.friendships.find_or_initialize_by(:friend_id => params[:id]).confirmed!
    end
   redirect_back(fallback_location: root_path)
  end


  def destroy
    @friendship = Friendship.where(user_id:params[:id]).where(friend_id:current_user).first
    @friendship.destroy
    redirect_back(fallback_location: root_path)
  end
end
