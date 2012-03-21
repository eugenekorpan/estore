Estore::Application.routes.draw do
  devise_for :users

  resources :products

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
