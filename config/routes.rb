Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "links#index"

  resources :links, only: [:show, :new, :create] do
    resource :upvote, only: [:create]
    resource :downvote, only: [:create]
  end
end
