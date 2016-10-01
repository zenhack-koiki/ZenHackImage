Rails.application.routes.draw do
  
  resources :images
  resources :likes do
    collection do
      get 'search'
    end
  end

  get '/apis/zenhack/images', to: 'images#search'

end
