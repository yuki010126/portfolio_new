Rails.application.routes.draw do

  devise_for :customers

  resources :customers
  resources :chats


  root to: 'homes#top'
  get 'top/index'
  get "about" => "top#about" , as: "about"



end

