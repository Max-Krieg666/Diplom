Rails.application.routes.draw do

  resources :student_rating_elements, except: [:index, :show]
  resources :rating_elements, except: [:index]
  resources :documents
  resources :sections
  resources :pages
  resources :disciplines
  resources :groups
  resources :users

	get 'login' => "sessions#new", as: :login
	post 'login' => "sessions#create"
	patch 'logout' => "sessions#destroy"

	root 'sessions#new'
end
