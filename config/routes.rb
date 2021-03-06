Rails.application.routes.draw do
  resources :student_rating_elements, except: [:index, :show]
  resources :rating_elements, except: [:index]
  resources :documents
  resources :pages
  resources :sections, except: [:index, :show]
  resources :disciplines do
    member do
      get 'detailed_rating'
    end
  end
  resources :groups
  resources :users

  post "markdown/preview"

	get 'login' => "sessions#new", as: :login
	post 'login' => "sessions#create"
	patch 'logout' => "sessions#destroy"

	root 'sessions#new'
end
