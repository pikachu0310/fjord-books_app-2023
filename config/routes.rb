Rails.application.routes.draw do
  resources :comments
  resources :reports
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  post 'comments/create_comment', to: 'comments#create_comment', as: 'comments_create_comment'
end
