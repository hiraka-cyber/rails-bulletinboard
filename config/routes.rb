Rails.application.routes.draw do
  root 'threaders#index'
  resources :threaders do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
