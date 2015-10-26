Rails.application.routes.draw do
  get "home/index"
  get "home/minor"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'home#index'

  get "departments/:id/:display_name", to: 'departments#show'
  get "departments", to: 'departments#index'
  
  get "leaderboards", to: "leaderboards#index"

  get "contracts/find", to: "contracts#find"
  get "contracts/search", to: "contracts#search"

end
