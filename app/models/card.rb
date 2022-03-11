class Card < ApplicationRecord
  belongs_to :deck

  validates :value, presence: true

  MINUTE_UNITS = %w[min minute minutes].freeze
  DAY_UNITS = %w[day days d].freeze
  WEEK_UNITS = %w[week weeks w].freeze
  SPRINT_UNITS = %w[sprint sprints].freeze

  def display_value
    return value if unit.blank?

    if value.zero?
      unit
    else
      "#{significant_value} #{unit}"
    end
  end

  # strip insignificant trailing zeros and stringify
  def significant_value
    if value.to_i == value
      value.to_s.delete_suffix('.0')
    else
      value.to_s
    end
  end

  def standardised_value
    return value if unit.blank?

    value / unit_divisor
  end

  def aggregatable?
    return false if value.zero? && unit.present?

    true
  end

  # for time units, divide by the appropriate factor to get hours
  def unit_divisor
    if unit.in?(MINUTE_UNITS)
      60
    elsif unit.in?(DAY_UNITS)
      0.2
    elsif unit.in?(WEEK_UNITS)
      0.04
    elsif unit.in?(SPRINT_UNITS)
      0.02
    else
      1 # hours, or other random units we don't know what to do with
    end
  end
end
