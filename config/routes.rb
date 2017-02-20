Rails.application.routes.draw do
  root to: 'pages#index'
  resources :quotes, only: :index
  resources :array_searches, only: [:new, :create]
  resources :blackjack_games, only: :new
  get '/blackjack_game', to: 'blackjack_games#show'
  post '/blackjack_games/hit', to: 'blackjack_games#hit'
  post '/blackjack_games/stand', to: 'blackjack_games#stand'
end
