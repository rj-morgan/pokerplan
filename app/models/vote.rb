class Vote < ApplicationRecord
  belongs_to :round
  belongs_to :card

  validates :user, presence: true

  def score
    return unless card.aggregatable?

    card.standardised_value
  end
end
