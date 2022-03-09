class Round < ApplicationRecord
  belongs_to :room

  has_many :votes

  delegate :deck, :cards, to: :room
end
