Rails.application.routes.draw do
  root :to => "collections#index"

  resources :collections do
    collection do
      get 'search'
    end
  end
end
