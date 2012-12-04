Wedding::Application.routes.draw do
  root to: "info#index"

  resources :families
  resources :people

  resource :rsvp do
    collection do
      post :check
      post :confirm
    end
  end

  resources :sessions do
    collection do
      get :log_out
    end
  end

  resources :info do
    collection do
      get :index
      get :contact
      get :registry
    end
  end
end
