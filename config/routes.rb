Rails.application.routes.draw do
  resources :cards
  resources :decks do
    resources :cards
  end
  resources :rooms
  resources :rounds
  resources :votes
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
