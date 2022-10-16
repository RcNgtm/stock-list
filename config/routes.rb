Rails.application.routes.draw do
  root 'stocks#index'
  resources :stocks
  resources :reports, only: [:index, :new, :create]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
    devise_scope :user do
    get 'users/index', to: 'users/registrations#index'
    get 'users/destroy', to: 'users/sessions#destroy'
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
