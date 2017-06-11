Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create] do
    collection do
      post 'confirm'
    end
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
