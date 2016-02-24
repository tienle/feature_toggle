$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feature_toggle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feature_toggle"
  s.version     = FeatureToggle::VERSION
  s.authors     = ["Tien Le"]
  s.email       = ["tienlex@gmail.com", "tien.le@employmentinnovations.com"]
  s.homepage    = "https://github.com/tienle/feature_toggle"
  s.summary     = "Feature toggles on the fly"
  s.description = "Declare and manage feature flags easily"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3"
end
