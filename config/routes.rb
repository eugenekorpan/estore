Estore::Application.routes.draw do

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :showroom do
    resources :products, :only => :index
  end

  resources :products, :only => :show

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
