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

  def self.on?(feature, state_context)
    enable_state_names = Feature.where(feature: feature, enable: true).pluck(:state)
    enable_states = states.select {|state| enable_state_names.include?(state.name.to_s) }
    enable_states.any? do |state|
      state_context.instance_eval &state.value
    end
  end
end
