Rails.application.routes.draw do

  root to: "static_pages#root"

  get "auth/:provider/callback", to: "api/sessions#omniauth"

  namespace :api, defaults: {format: :json} do
    get "/search", to: "search#search"
    resource :session, only: [:show, :create, :destroy]
    resources :users, except: [:new, :edit]
  end

end
