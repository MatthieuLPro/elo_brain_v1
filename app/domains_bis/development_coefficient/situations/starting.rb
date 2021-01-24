# frozen_string_literal: true

module DevelopmentCoefficient
  module Situations
    class Starting
      COEFFICIENT = 40
      NB_MAXIMUM_MATCHES = 30
      def initialize(nb_matches:)
        @nb_matches = nb_matches
      end

      def eligible?
        @nb_matches < NB_MAXIMUM_MATCHES
      end
    end
  end
end
