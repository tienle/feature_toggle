module FeatureToggle
  class ApplicationController < ::ApplicationController
    layout (FeatureToggle.configuration.layout || 'application')

    if FeatureToggle.configuration.authentication_method
      before_filter FeatureToggle.configuration.authentication_method
    end
  end
end
