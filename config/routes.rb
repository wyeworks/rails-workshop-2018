Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boards, only: %i[create show] do
    resources :lists, only: %i[create show]
  end
end
