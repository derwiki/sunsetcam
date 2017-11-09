Rails.application.routes.draw do
  resources :photos
  root to: 'visitors#index'

  post '/upload' => 'visitors#upload'
end
