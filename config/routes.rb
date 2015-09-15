Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :paragraphs
  end
  root 'posts#index'
end
