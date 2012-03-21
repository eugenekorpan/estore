Estore::Application.routes.draw do

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :showrooms, :only => :index do
    resources :products, :only => [:index, :show]
  end

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
