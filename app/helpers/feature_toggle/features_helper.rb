module FeatureToggle
  module FeaturesHelper
    def turn_on_feature?(feature, state)
      @features.find do |f|
        f.feature == feature.name.to_s &&
        f.state == state.name.to_s &&
        f.enable?
      end
    end
  end
end
