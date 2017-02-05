Rails.application.routes.draw do
  resources :improves
  resources :bads
  resources :goods
  resources :models
  root to: "application#angular"
end
