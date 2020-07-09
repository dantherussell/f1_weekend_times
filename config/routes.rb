Rails.application.routes.draw do
  root to: "weekends#index"

  resources :weekends, only: [:index, :show]
end
