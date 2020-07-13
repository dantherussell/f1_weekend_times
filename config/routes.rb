Rails.application.routes.draw do
  root to: "weekends#index"

  resources :weekends do
    resources :events, except: [:index, :show]
  end
end
