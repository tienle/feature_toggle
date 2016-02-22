Rails.application.routes.draw do

  mount FeatureToggle::Engine => "/feature_toggle"
end
