Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  # Defines the root path route ("/")
  root to: 'home#index'
  resources :recipes do
    resources :recipes_foods, only: %i[new create destroy]
  end
  resources :foods, only: %i[index show new create destroy]
  resources :public_recipes, only: [:index]

  resources :shopping_lists, only: [:index] do
    collection do
      get 'generate'
    end
  end

  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
end
