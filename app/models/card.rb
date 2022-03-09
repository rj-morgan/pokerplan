class Card < ApplicationRecord
  belongs_to :deck

  validates :value, presence: true
end
