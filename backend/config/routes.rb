# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :v1, defaluts: { format: :json } do
    namespace :collections do 
      get 'spotlight'
    end
  end
  namespace :v1, defaluts: { format: :json } do
    get 'home', to: 'home#index'
  end
end
