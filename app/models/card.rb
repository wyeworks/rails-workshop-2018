class Card < ApplicationRecord
  validates :text, :list, presence: true

  belongs_to :list
end
