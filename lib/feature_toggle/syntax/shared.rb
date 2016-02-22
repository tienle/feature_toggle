module FeatureToggle
  module Syntax
    module Shared
      def self.included(base)
        base.attr_reader :name, :desc
      end

      def initialize(name, &block)
        @name = name

        instance_eval(&block) if block_given?
      end

      def desc(description)
        @desc = description
      end
    end
  end
end
