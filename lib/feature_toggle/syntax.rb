require 'feature_toggle/syntax/feature'
require 'feature_toggle/syntax/state'

module FeatureToggle
  module Syntax
    def define(&block)
      DSL.run(block)
    end

    class DSL
      def self.run(block)
        new.instance_eval(&block)
      end

      def feature(name, &block)
        self.features << Feature.new(name, &block)
      end

      def state(name, &block)
        self.states << State.new(name, &block)
      end

      private

      def states
        FeatureToggle.states
      end

      def features
        FeatureToggle.features
      end
    end
  end
end

#FeatureToggle.define do
  #feature :employee_file do
    #desc"Access employee file"

    #feature :create
    #feature :delete
  #end

  #state :premium do
    #desc "Premium user"

    #current_user.paid?
  #end

  #state :free do
    #desc "Trial user"

    #current_user.free?
  #end
#end
