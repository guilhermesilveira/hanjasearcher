Rails.application.routes.draw do
  resources :hanjas
  root :to => "hanjas#index"
end
