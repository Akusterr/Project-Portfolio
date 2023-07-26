Rails.application.routes.draw do
  devise_for :users, path: '', path_name: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio-show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  post 'blogs', to: 'blogs#create'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
