Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :tasks

  # Root setup
  authenticated :user do
    root :to => "tasks#index"
  end

  root :to => "todo_list#index", as: :unauthenticated_root
  get '/todo_list/about'=> 'todo_list#about', as: :about
  get '/todo_list/contact'=> 'todo_list#contact', as: :contact
  get '/todo_list/help' => 'todo_list#help', as: :help
end
