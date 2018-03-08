class Board < ApplicationRecord
  validates :name, presence: true

  has_many :lists
end
