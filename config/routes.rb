Kssksscoincoin::Application.routes.draw do
  get "home/index"

  get "campaign/index"
  get "campaign/show"
  get "campaign/create"

  get "profile/show"
  get "profile/activity"
  get "profile/campaigns"
  get "profile/coinscoins"
  get "profile/settings"

  mount API => '/api'

  root to: 'home#index'
end
