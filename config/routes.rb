Rails.application.routes.draw do

  get "/", to: 'homes#index'

  resources :users
  resources :user_data_fields
  resources :user_data_groups do
    member do
      post 'add_fields'
    end
  end

  get "/questionnaire", to: 'user_data#index'
  get "/questionnaire/fill", to: 'user_data#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
