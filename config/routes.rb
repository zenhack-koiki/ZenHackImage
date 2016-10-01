Rails.application.routes.draw do
  
  resources :likes
	get "/test", to: 'test#index'

end
