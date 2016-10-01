Rails.application.routes.draw do
  
  get 'recommend/index'

  resources :likes do
    collection do
      get 'search'
    end
  end

  get '/images', to: 'images#search'

end
