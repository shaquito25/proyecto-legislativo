Rails.application.routes.draw do
  resources :inventories
  resources :expedients
  devise_for :users
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  match 'reportes_solicitud', to: 'expedients#reportes', via: [:get,:post]
  root "static_pages#landing_page"
end
