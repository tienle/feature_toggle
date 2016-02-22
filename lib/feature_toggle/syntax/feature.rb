require 'feature_toggle/syntax/shared'

module FeatureToggle
  module Syntax
    class Feature
      attr_reader :childrens

      include Shared

      def feature(name, &block)
        name = self.name + "." + name

        @childrens << Feature.new(name, block)
      end
    end
  end
end
