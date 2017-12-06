Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'users#index'

  # User Signup
    get '/', to:'users#index', as: 'home'
    get '/signup', to:'users#new', as: 'signup'
    post '/signup', to:'users#create'

  # User Login
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

  # ChatBox
    resources :chatboxes do
      resource :userchatboxes
      resources :messages
    end

    mount ActionCable.server => '/cable'

end
