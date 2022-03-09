class Room < ApplicationRecord
  has_many :rounds

  has_one :deck_assignment, dependent: :destroy

  has_one :deck, -> { readonly }, through: :deck_assignment

  has_many :cards, -> { readonly }, through: :deck
end
