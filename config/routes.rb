Rails.application.routes.draw do
  resources :cards
  resources :decks do
    resources :cards
  end
  resources :rooms
  resources :rounds
  resources :votes
  resources :modes, only: %i[update]
  
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
