Rails.application.routes.draw do

  post ':user_id/posts/:post_id/likes' => 'likes#create'

  get 'posts' => 'posts#show'
  post 'posts/:user_id/create' => 'posts#create'
  get 'posts/:post_id' => 'posts#show_one'
  delete 'posts/:post_id' => 'posts#destroy'

  get 'users' => 'users#new'
  post 'users/new' => 'users#create'
  get 'users/:user_id' => 'users#show'

  get 'sessions/new' => 'users#new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/new' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
