Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students do
    resources :addresses, only: %i[new create]
    resources :courses, only: %i[show]
  end
end
