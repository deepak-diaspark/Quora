Rails.application.routes.draw do
  get '/questions/answer', to: 'questions#answer', as: 'questions_answer'
  
  devise_for :users
  resources :questions do
    resources :comments do 
        put "like", to: "comments#upvote" , as: 'comments_upvote'
        put "dislike", to: "comme#downvote", as: 'comments_downvote'
      end
end

  root to: 'welcome#index'

end