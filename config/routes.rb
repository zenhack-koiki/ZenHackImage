Rails.application.routes.draw do
  
  resources :likes do
    collection do
      get 'search'
    end
  end
	get "/test", to: 'test#index'

end