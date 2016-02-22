require "feature_toggle/engine"
require 'feature_toggle/syntax'

module FeatureToggle
  extend Syntax

  def self.states
    @states ||= []
  end

  def self.features
    @states ||= []
  end
end
