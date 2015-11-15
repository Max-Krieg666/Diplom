Rails.application.routes.draw do

  resources :users

	get 'login' => "sessions#new", as: :login
	post 'login' => "sessions#create"
	patch 'logout' => "sessions#destroy"

	root 'sessions#new'
end
