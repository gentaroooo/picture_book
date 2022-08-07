class BoardAuthor < ApplicationRecord
  belongs_to :board
  belongs_to :author
  validates :board_id, uniqueness: { scope: :author_id }
end
