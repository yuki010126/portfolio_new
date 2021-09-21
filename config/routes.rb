Rails.application.routes.draw do

  devise_for :customers

  resources :customers

  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'



  resources :categories, only: [:show]

  resources :kinds, only: [:show]

  resources :memos

  root to: 'homes#top'
  get 'top/index'
  get "about" => "top#about" , as: "about"
  get "answer" => "top#answer" , as: "answer"


  resources :chats do
    resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end

  resources :discussions do
    resources :opinions, only: [:create, :destroy]
     resource :bookmarks, only: [:create, :destroy]
  end

  resources :hashtags, only: [:index, :show] #hashtagsコントローラー作成後記入

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'


  get 'search' => 'chats#search'

#   get '/discussion/hashtag/:name' => 'discussions#hashtag'
#   get '/discussion/hashtag' => 'discussions#hashtag'

 end





