# frozen_string_literal: true

Rails.application.routes.draw do
  # root to: "home#index"
  resources :users, only: %i[new create]

  # API Rest
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index]
    end
  end
end
