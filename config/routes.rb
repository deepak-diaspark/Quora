Rails.application.routes.draw do
  get '/questions/answer', to: 'questions#answer', as: 'questions_answer'
  
  devise_for :users
  resources :questions do
  resources :comments
  end
  root to: 'welcome#index'
  
end
