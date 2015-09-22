class Api::V1::MatchesController < ApplicationController
  def all
    matches = Match.all
    render json: matches
  end

  def show_player_profile
    id = params[:id]
    name = Player.find(id).name
    profile = Match.show_player_results(id)
    rating = Match.player_rating(id)
    response = { :rating => rating, :profile => profile, :name => name }
    render json: response
  end

  def show_player_victories
    id = params[:player_id]
    matches = Match.find_by_winner_id(id)
    render json: matches
  end

  def show_faction_results
    faction = params[:faction]
    matches = Match.show_faction_results(faction)
    rating = Match.victory_rating(faction)
    response = { :rating => rating, :matches => matches }
    render json: response
  end
end
