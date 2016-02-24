module FeatureToggle
  module Controller
    extend ActiveSupport::Concern

    included do
      helper FeatureToggle::FeaturesHelper
    end

    class_methods do
      def require_feature!(feature, options = {})
        before_action(options) do |controller|
          raise FeatureToggle::NotAuthorizedError unless FeatureToggle.on?(feature, controller)
        end
      end
    end
  end
end
