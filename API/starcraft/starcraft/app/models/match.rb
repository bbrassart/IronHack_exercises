class Match < ActiveRecord::Base
  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  def self.show_player_results(id)
    (Match.player_wins(id) + Match.player_losses(id))
  end

  def self.player_wins(id)
    Match.where(winner: id)
  end

  def self.player_losses(id)
    Match.where(loser: id)
  end

  def self.player_rating(id)
    wins = Match.where(winner: id).count
    losses = Match.where(loser: id).count
    return ((wins.to_f / ( wins.to_f + losses.to_f)) * 100).to_s + '% victory ratio'
  end

  def self.show_faction_results(faction)
    (Match.faction_wins(faction) + Match.faction_losses(faction))
  end

  def self.faction_wins(faction)
    Match.where(winner_faction: faction)
  end

  def self.faction_losses(faction)
    Match.where(loser_faction: faction)
  end

  def self.victory_rating(faction)
    wins = Match.where(winner_faction: faction).count
    losses = Match.where(loser_faction: faction).count
    return ((wins.to_f / ( wins.to_f + losses.to_f)) * 100).to_s + '% victory ratio'
  end

end
