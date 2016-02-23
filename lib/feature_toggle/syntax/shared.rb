module FeatureToggle
  module Syntax
    module Shared
      def self.included(base)
        base.send :attr_reader, :name
      end

      def initialize(name, block = nil)
        @name = name
        instance_eval(&block) if block.is_a? Proc
      end

      def desc(description = nil)
        return @desc if description.blank?

        @desc = description
      end
    end
  end
end
