class CreateBoardAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :board_authors do |t|
      t.references :board, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :board_authors, [:board_id, :author_id], unique: true
  end
end
