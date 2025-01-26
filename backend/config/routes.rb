# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, defaults: { format: :json } do
    get 'spotlights', to: 'spotlights#index'
    namespace :collections do
      get 'spotlight'
      get 'recent'
    end
    get 'home', to: 'home#index'
    get 'categories', to: 'categories#index'
  end
end