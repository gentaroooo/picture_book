class AddPublishedDate < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :published_date, :string
  end
end
