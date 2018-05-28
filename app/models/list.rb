class List < ApplicationRecord
  validates :name, :board, presence: true

  belongs_to :board

  has_many :cards, dependent: :destroy
end
