Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, param: :name, only: [] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end

  resources :channels, param: :name, only: [ :show ]
  root to: 'channels#show'
end
