module FeatureToggle
  module ApplicationHelper
    def method_missing(method, *args, &block)
      if (method.to_s.end_with?('_path') || method.to_s.end_with?('_url')) && main_app.respond_to?(method)
        main_app.send(method, *args)
      else
        super
      end
    end

    def turn_on_feature?(feature, state)
      @features.find do |f|
        f.feature == feature.name.to_s &&
        f.state == state.name.to_s &&
        f.enable?
      end
    end

  end
end
