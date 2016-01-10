class Player < ActiveRecord::Base
  has_many :matches, foreign_key: "winner_id"
end
