# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :subscriptions do
    collection do
      get 'subscription_type_list', to: 'subscriptions#subscription_type_list'
      get 'success', to: 'subscriptions#success'
      get 'cancel', to: 'subscriptions#cancel'
    end
  end

  root 'welcome#index'
end
