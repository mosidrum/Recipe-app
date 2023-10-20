Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :recipes do
    resources :recipes_foods, only: %i[new create destroy]
  end

  resources :foods, only: %i[index show new create destroy]
  resources :public_recipes, only: [:index]

  # get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

  resources :shopping_lists, only: [:index] do
    collection do
      get 'generate'
    end
  end
end
