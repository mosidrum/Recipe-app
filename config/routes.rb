Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :recipes do
    resources :recipe_foods, only: %i[new create destroy]
  end

  resources :foods, only: %i[index show new create destroy]
  resources :public_recipes, only: [:index]
  resources :shopping_lists, only: [:index] do
    collection do
      get 'generate'
    end
  end

  get 'public_recipes_custom', to: 'recipes#public_recipes', as: 'public_recipes_custom'
end
