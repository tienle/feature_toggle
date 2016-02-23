module FeatureToggle
  module FeaturesHelper
    def turn_on_feature?(feature, state)
      @features.exists? do |feature|
        feature.feature == feature.name.to_s &&
        feature.state == state.name.to_s &&
        feature.enable?
      end
    end
  end
end
