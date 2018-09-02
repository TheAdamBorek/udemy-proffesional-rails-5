Rails.application.routes.draw do
  root to: 'posts#index'
  get 'pages/about'
  get 'pages/contact'
  resources :posts, exlude: [:show]
  resources :portfolios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
