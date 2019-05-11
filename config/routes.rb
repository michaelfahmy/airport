Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'admin/dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :flights, only: :index
      resources :reservations, only: %i[index show create destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
