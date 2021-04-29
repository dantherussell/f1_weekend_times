Rails.application.routes.draw do
  root to: "seasons#index"
  get 'auth' => 'seasons#auth'

  resources :seasons do
    resources :weekends, except: [:index] do
      get 'print', on: :member
      resources :events, except: [:index, :show]
    end
  end

  resources :series do
    resources :sessions, except: [:index, :show]
  end
end
