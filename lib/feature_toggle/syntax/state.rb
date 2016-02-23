require 'feature_toggle/syntax/shared'

module FeatureToggle
  module Syntax
    class State
      include Shared

      def value(&block)
        if block_given?
          @value = block
        else
          @value
        end
      end
    end
  end
end
