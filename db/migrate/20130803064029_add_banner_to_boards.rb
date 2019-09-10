class AddBannerToBoards < ActiveRecord::Migration[5.0]
  def change
    add_attachment :boards, :banner
  end
end
