class AddDefaultValueToFriendshipsStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :friendships,
      :status,
      0
    )
  end
end
