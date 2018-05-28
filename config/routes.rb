Rails.application.routes.draw do
  resources :boards do
    resources :lists do
      resources :cards
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
