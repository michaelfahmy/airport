Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'admin/dashboard#index'

  namespace :api do
    resources :flights, only: :index
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
