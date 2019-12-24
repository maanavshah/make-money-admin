Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  namespace :api do
    devise_for :users
    get 'users/get_coins', to: 'users#get_coins'
    get 'users/set_coins', to: 'users#set_coins'
    get 'users/get_config', to: 'users#get_config'
  end
end
