Rails.application.routes.draw do
  
  get 'recommend/index'

  resources :images
  resources :likes do
    collection do
      get 'search'
    end
  end
	get "/test", to: 'test#index'

end
