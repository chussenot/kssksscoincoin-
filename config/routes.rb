Kssksscoincoin::Application.routes.draw do
  get "activity/show"
  get "coinscoins/show"
  get "campaign/index"
  get "campaign/show"

  get "profile/show"
  
  
  resources :contracts

  get "home/index"
  root to: 'home#index'
end
