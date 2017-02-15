Rails.application.routes.draw do
  resources :tables
  resources :improves
  resources :bads
  resources :goods
  resources :models
  root to: "application#angular"
end
