module FeatureToggle
  class Feature < ActiveRecord::Base
    attr_accessible :feature, :state, :enable if respond_to? :attr_accessible
  end
end
