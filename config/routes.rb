Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'start', to: "registrations#start", as: 'start'
    get 'signup', to: "registrations#new", as: 'signup'
    get 'login', to: "sessions#new", as: 'login'
    get 'settings', to: "registrations#edit", as: 'settings'
    delete 'logout', to: "sessions#destroy", as: 'logout'
  end

  # static
  get 'about' => 'pages#about', as: 'about'

  # leaderboards
  get 'leaderboard' => 'nominators#index', as: 'leaderboard'
  resources :nominators

  # chrome extension endpoints
  get 'nominees/check/:nominee/:nominator' => 'nominees#check'
  get 'warriors/check/:handle' => 'warriors#check'
  post 'nominate' => 'nominees#create'
  resources :nominees

end
