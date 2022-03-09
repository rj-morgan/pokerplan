Rails.application.routes.draw do
  get 'decks/new'
  get 'decks/show'
  get 'rounds/new'
  get 'rounds/show'
  get 'rooms/new'
  get 'rooms/show'
  get 'rooms/edit'
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
