class Author < ApplicationRecord
  has_many :board_authors, dependent: :destroy
  has_many :boards, through: :board_authors

  validates :name, presence: true, uniqueness: true
end
