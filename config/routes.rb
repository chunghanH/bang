Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'games#index'
  get '/games' => 'games#index'
  post '/games' => 'games#play'
  get '/clear' => 'games#clear'
end
