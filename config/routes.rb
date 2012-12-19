Latter::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :players

  resources :games, :except => [:edit, :update] do
    post :complete, :on => :member
    resource :score, :controller => 'scores', :only => [:new, :create]
  end

  resources :statboard, controller: :statboard, only: [:index]

  resources :activities, :controller => 'activity', :only => :index
  resources :statistics, :only => [:index]
  resources :players
  resources :badges, :only => [:index, :show]

  root :to => 'players#index'
  match "/pages/*slug" => "pages#show", :as => 'page'

end
