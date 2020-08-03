Rails.application.routes.draw do
  root to: "weekends#index"
  get 'auth' => 'weekends#auth'

  resources :weekends do
    resources :events, except: [:index, :show]
  end
end
