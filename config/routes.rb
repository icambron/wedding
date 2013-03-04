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
      get :new
      get :log_out
      get :unknown_account
      get :fail
      get :admin_required
    end
  end

  resources :info do
    collection do
      get :index
      get :contact
      get :registry
    end
  end

  resources :how_we_met
  resources :photos

  resources :attendees

  resources :admin

  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#fail"
end
