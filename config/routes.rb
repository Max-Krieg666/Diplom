Rails.application.routes.draw do
  get 'login' => "sessions#new", as: :login
  post 'login' => "sessions#create"
  patch 'logout' => "sessions#destroy"
end
