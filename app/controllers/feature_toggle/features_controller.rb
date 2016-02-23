require_dependency "feature_toggle/application_controller"

module FeatureToggle
  class FeaturesController < ApplicationController
    def index
      @features = Feature.all.to_a
    end

    def toggle
      feature = Feature.where(feature: params[:feature], state: params[:state]).first_or_initialize
      feature.enable = (params[:enable] == 'true')
      feature.save

      render nothing: true
    end
  end
end
