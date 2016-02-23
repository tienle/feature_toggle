require_dependency "feature_toggle/application_controller"

module FeatureToggle
  class FeaturesController < ApplicationController
    def index
      @features = Feature.all
    end
  end
end
