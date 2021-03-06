Rails.application.routes.draw do
  devise_for :user, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'
  get 'pages/about', as: 'about_me'
  get 'pages/contact', as: 'contact_me'
  
  resources :posts, exlude: [:show] do
    member do
      get :toggle_status
    end
  end
  resources :portfolios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
