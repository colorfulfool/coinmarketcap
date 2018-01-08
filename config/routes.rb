Rails.application.routes.draw do
  root to: 'coins#index'
  
  resources :coins, only: [] do
    post 'mark', on: :member
    post 'erase_markings', on: :collection
  end
  
  resources :distributions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
