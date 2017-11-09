Rails.application.routes.draw do
  root to: 'visitors#index'

  post '/upload' => 'visitors#upload'
end
