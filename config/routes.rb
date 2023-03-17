Rails.application.routes.draw do
 resources :articles
 root 'pages#home'
 get 'about', to: 'pages#about'
 get 'signup', to: 'users#new'
 resources :users, exept: [:new]
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
end
