module FeatureToggle
  class Engine < ::Rails::Engine
    isolate_namespace FeatureToggle

    initializer "feature_toggle", before: :load_config_initializers do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path|
        Rails.application.config.paths["db/migrate"] << expanded_path
      end
    end

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w{ feature_toggle/features.css feature_toggle/features.js }
    end
  end
end
