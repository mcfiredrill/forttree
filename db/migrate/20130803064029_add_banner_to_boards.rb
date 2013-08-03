class AddBannerToBoards < ActiveRecord::Migration
  def change
    add_attachment :boards, :banner
  end
end
