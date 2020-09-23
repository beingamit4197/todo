Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
       end
      end
   end

 # root 'todo_lists#index'
 root 'user#home'

 devise_scope :user do
  get 'user/sign_in', to: 'user/sessions#new', as: :new_user_session_path
  get 'user/sign_out', to: 'user/sessions#destroy', as: :destroy_user_session_path
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
