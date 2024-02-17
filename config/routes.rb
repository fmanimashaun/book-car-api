Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cities
      resources :reservations
      resources :cars
      resources :engine_type, except: [:index]
    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/current_user', to: 'users/current_user#index'
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
end
