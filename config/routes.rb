Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    concern :paginatable do
      get "(page/:page)", action: :index, on: :collection, as: ""
    end
    resources :users, concerns: :paginatable do
      member do
        resources :following, only: :index
        resources :followers, only: :index
      end
    end
    resources :microposts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
  end
end
