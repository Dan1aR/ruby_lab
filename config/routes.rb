# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts
    root 'posts#index'

    get 'session/login'
    get 'session/create'
    get 'session/logout'
    get 'session/registrate'
    get 'session/update'
    resources :users
  end

  resources :posts do
    member do
      get :delete_image_attachment
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
