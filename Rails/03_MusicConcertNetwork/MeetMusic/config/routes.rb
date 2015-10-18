Rails.application.routes.draw do

  get '/' => 'site#home'
  post'/concerts/:concert_id' => 'comments#create'
  get '/concerts/mostpopular' => 'comments#mostpopular'

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"



  resources :concerts, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :comments, only: [:index, :show, :create, :new, :edit, :destroy]
    end

  resources :users, only: [:new, :create]


 get '/concerts/mostpopular' => 'comments#mostpopular'

end
