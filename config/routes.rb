Rails.application.routes.draw do
  get 'top/index'
  get 'customers/show'
  get 'users/show'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'homes#top'
  resources :customers
  get "about" => "top#about" , as: "about"
end
