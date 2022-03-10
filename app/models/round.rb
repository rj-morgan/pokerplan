class Round < ApplicationRecord
  belongs_to :room

  has_many :votes

  delegate :deck, :cards, to: :room

  def mean_score
    return nil if scores.empty?

    (scores.sum / scores.count).round(1) # more than 1dp doesn't make sense
  end

  def median_score
    return nil if scores.empty?

    mid = scores.count / 2
    scores.count.odd? ? scores[mid] : (scores[mid.floor] + scores[mid.ceil]) / 2
  end

  def modal_score
    return nil if scores.empty?

    modes = frequencies.select { |_v, n| n == frequencies.values.max }
    vals = modes.map { |v, _n| v.to_s }
    vals.join(', ')
  end

  # hash of score counts
  def frequencies
    return nil if scores.empty?

    scores.group_by(&:itself).transform_values(&:count)
  end

  def scores
    votes.map(&:score).compact.sort
  end
end
