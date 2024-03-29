Rails.application.routes.draw do
 resources :articles
 root 'pages#home'
 get 'about', to: 'pages#about'
 get 'signup', to: 'users#new'
 resources :users, exept: [:new]
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 get 'logout', to: 'sessions#destroy'
 resources :categories, except: [:destroy]
end
