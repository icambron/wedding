Wedding::Application.routes.draw do
  match "/(*path)" => redirect{|params| "https://www.isaacandanjali.com/#{params[:path]}"}, :constraints => { :protocol => "http://", domain: "isaacandanjali.com" }
  match "/(*path)" => redirect{|params| "https://www.isaacandanjali.com/#{params[:path]}"}, :constraints => { :subdomain => "", domain: "isaacandanjali.com" }

  root to: "info#index"

  resources :families do
    post :rehash
  end

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
      get :photos
    end
  end

  resources :gifts do
    collection do
      get "thanks"
    end
  end

  resources :how_we_met
  resources :attendees
  resources :admin

  match "/emails/:template", to: "emails#index"

  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#fail"
end
