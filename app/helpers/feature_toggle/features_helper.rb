module FeatureToggle
  module FeaturesHelper
    def feature?(name)
      FeatureToggle.on?(name, self)
    end
  end
end
