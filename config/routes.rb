Wedding::Application.routes.draw do
  root to: "info#index"

  resources :families
  resources :people

  resources :info do
    collection do
      get :index
      get :contact
      get :registry
    end
  end
end
