# frozen_string_literal: true

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
    get 'users/redeem_coins', to: 'users#redeem_coins'
  end
end
