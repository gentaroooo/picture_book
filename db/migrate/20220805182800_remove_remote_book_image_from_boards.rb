class RemoveRemoteBookImageFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :remote_book_image, :string
  end
end
