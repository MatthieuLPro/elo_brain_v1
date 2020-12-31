Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :players, only: %i[index]
    end
  end

  # Sessions
  resources :sessions, only: %i[new create destroy]

  # Admin
  namespace :admin do
    get '/home', to: 'home#home'
    get '/rankings', to: 'home#rankings'
    get '/events', to: 'home#events'
    get '/matches', to: 'home#matches'
    get '/players', to: 'home#players'

    # Sidekiq monitoring
    require 'sidekiq/web'
    require 'sidekiq/cron/web'
    require 'admin_constraint'
    mount Sidekiq::Web => '/sidekiq', :constraints => AdminConstraint.new
  end

end
