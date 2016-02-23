FeatureToggle::Engine.routes.draw do
  resources :features, only: [:index]
  root :to => "features#index"
end
