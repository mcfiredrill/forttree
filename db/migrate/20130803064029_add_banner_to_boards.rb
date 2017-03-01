class AddBannerToBoards < ActiveRecord::Migration[4.2]
  def change
    add_attachment :boards, :banner
  end
end
