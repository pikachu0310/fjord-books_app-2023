Rails.application.routes.draw do
  resources :comments
  resources :reports
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :books do
    post 'create_books_comment', to: 'comments#create_books_comment', on: :member
  end

  resources :reports do
    post 'create_reports_comment', to: 'comments#create_reports_comment', on: :member
  end
end
