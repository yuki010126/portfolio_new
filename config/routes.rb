Rails.application.routes.draw do

  devise_for :customers

  resources :customers, only: [:show, :edit, :update]


  resources :chats do
    resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end

  resources :discussions do
    resources :opinions, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  #   resource :favorites, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  root to: 'homes#top'
  get 'top/index'
  get "about" => "top#about" , as: "about"


  get 'search' => 'chats#search'

end




