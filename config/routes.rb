DeviseExample::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
      get 'user_providers' => 'user_providers#index'
      post 'user_providers' => 'user_providers#create'
      get 'providers' => 'providers#index'
      post 'sub_providers' => 'sub_providers#index'
      put 'sub_providers' => 'sub_providers#create'
      delete 'sub_providers' => 'sub_providers#destroy'
      get 'content_areas' => 'content_areas#index'
      post 'content_areas' => 'content_areas#create'
      delete 'content_areas' => 'content_areas#destroy'
      post 'hide_content_areas' => 'hide_content_areas#create'
      get 'delivery_modes' => 'delivery_modes#index'
      post 'delivery_modes' => 'delivery_modes#create'
      delete 'delivery_modes' => 'delivery_modes#destroy'
      post 'hide_delivery_modes' => 'hide_delivery_modes#create'
      get 'user_content_elements' => 'user_content_elements#index'
      put 'user_content_elements' => 'user_content_elements#show'
      post 'provider_content_elements' => 'provider_content_elements#index'
      put 'provider_content_elements' => 'provider_content_elements#show'
      post 'manage_content_elements' => 'manage_content_elements#index'
      put 'manage_content_elements' => 'manage_content_elements#create'
      get 'formats' => 'formats#index'
      post 'formats' => 'formats#create'
      put 'formats' => 'formats#create'
    end
  end

  devise_for :users, :admins

  get '/token' => 'home#token', as: :token

  resources :home, only: :index
  resources :admins, only: :index

  root 'home#index'

end
