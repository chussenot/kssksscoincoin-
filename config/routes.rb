Kssksscoincoin::Application.routes.draw do
  resources :campaigns

  get "home/index"

  get "profile/show"
  get "profile/activity"
  get "profile/campaigns"
  get "profile/coinscoins"
  get "profile/settings"

  mount API => '/api'

  root to: 'home#index'
end
