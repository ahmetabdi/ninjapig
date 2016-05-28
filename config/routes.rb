Rails.application.routes.draw do
  root to: 'pages#home'

  resources :movies do
    member do
      get :iframe
    end
  end
end
