# frozen_string_literal: true

module Elos
  module Contracts
    class Player < Dry::Validation::Contract
      params do
        required(:information).value(Types::PlayerEntity)
        required(:development_coefficient).value(Types::CoefficientEntity)
        required(:probability_of_win).value(Types::ProbabilityEntity)
      end
    end
  end
end
