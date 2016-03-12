Rails.application.routes.draw do
  resources :lyrics, only: [:destroy] do
    collection do
      get :random
    end
  end
  root 'lyrics#index'
end
