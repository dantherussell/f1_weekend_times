Rails.application.routes.draw do
  root to: "seasons#index"
  get 'auth' => 'seasons#auth'

  resources :seasons do
    resources :weekends, except: [:index] do
      resources :events, except: [:index, :show]
    end
  end
end
