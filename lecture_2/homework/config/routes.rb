Rails.application.routes.draw do
  resources :clans, only: %i[index create] do
    resources :warriors, module: :clans do
      resources :weapons
    end
  end
end
