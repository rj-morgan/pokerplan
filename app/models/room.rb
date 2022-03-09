class Room < ApplicationRecord
  has_many :rounds, foreign_key: :roomid
end
