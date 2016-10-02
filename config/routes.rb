Rails.application.routes.draw do
  get 'recommend/index'

  resources :likes do
    collection do
      get 'search'
    end
  end

  resources :images, only: %i(destroy)
  get '/images', to: 'images#search'
  get '/admin/images', to: 'images#index'
end
