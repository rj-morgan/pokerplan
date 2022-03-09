class Round < ApplicationRecord
  belongs_to :room, foreign_key: :roomid
end
