module ApplicationHelper

  def notifications
    return unless user_signed_in?
    @notifications =  Friendship.all.where(friend_id: current_user).where(status: "pending")
  end

end
