Rails.application.routes.draw do
  devise_for :users
  root 'barbecues#index'
  namespace :api do
    namespace :v1 do
      get 'barbecues' => 'barbecues#show_all'
      get 'barbecues/:id' => 'barbecues#show_bbq'
      post 'barbecues/join' => 'barbecues#join_bbq'
      post 'barbecues/item/' => 'barbecues#additem'
    end
  end

  resources :barbecues, only: [ :index, :new, :create ]
end
