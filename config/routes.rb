Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :initial_data, only: [:index]
      resources :cities, except: [:index, :new, :edit]
      resources :cars, except: [:index, :new, :edit]
      resources :reservations, except: [:new, :edit]
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
