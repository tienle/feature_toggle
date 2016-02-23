FeatureToggle::Engine.routes.draw do
  resources :features, only: [:index] do
    collection do
      post :toggle
    end
  end
  root :to => "features#index"
end
