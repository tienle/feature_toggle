require "feature_toggle/engine"
require 'feature_toggle/syntax'
require 'ostruct'

module FeatureToggle
  extend Syntax

  def self.setup(&block)
    yield configuration
  end

  def self.states
    @states ||= []
  end

  def self.features
    @features ||= []
  end

  def self.configuration
    @config ||= OpenStruct.new
  end
end
