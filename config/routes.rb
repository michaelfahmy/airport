Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue ActiveAdmin::DatabaseHitDuringLoad => e
    Rails.logger.warn "ActiveAdmin: #{e.class}: #{e}"
  end

  root 'admin/dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :flights, only: :index
      resources :reservations, only: %i[index show create destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
