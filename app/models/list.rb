class List < ApplicationRecord
  validates :name, :board, presence: true

  belongs_to :board
end
