class Vote < ApplicationRecord
  belongs_to :round
  belongs_to :card

  validates :user, presence: true
end
