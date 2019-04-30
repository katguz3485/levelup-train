Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :clans do
        resources :samurais, only: %i[index create update destroy]
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
