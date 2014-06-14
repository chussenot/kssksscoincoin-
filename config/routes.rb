Kssksscoincoin::Application.routes.draw do
  resources :contracts

  get "home/index"
  root to: 'home#index'
end
