Landing::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "/tours", :to => "pages#tours"
  get "/pricing", :to => "pages#pricing"
  get "/explore", :to => "pages#explore"

  root :to => "pages#welcome"
end
