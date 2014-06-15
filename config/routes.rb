Kssksscoincoin::Application.routes.draw do
  get "campaign/index"
  get "campaign/show"

  get "profile/show"
  get "profile/activity"
  get "profile/campaigns"
  get "profile/coinscoins"

  resources :contracts

  get "home/index"
  root to: 'home#index'
end
