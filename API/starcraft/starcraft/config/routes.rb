Rails.application.routes.draw do
  get '/matches/index' => 'matches#index'
  namespace :api do
    namespace :v1 do
      get '/matches/all' => 'matches#all'
      get '/victories/:player_id' => 'matches#show_player_victories'
      get '/matches/:faction' => 'matches#show_faction_results'

      get 'players/:id' => 'matches#show_player_profile'
    end
  end
end
