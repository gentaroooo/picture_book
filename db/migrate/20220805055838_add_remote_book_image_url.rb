class AddRemoteBookImageUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :remote_book_image, :string
    add_column :boards, :info_link, :text
  end
end
