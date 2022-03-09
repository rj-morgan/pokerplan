class DeckAssignment < ApplicationRecord
  belongs_to :room
  belongs_to :deck
end
