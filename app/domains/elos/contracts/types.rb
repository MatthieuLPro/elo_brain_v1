# frozen_string_literal: true

module Elos
  module Contracts
    module Types
      include Dry::Types()

      PlayerEntity = Types.Instance(::Players::Entities::Information)
      CoefficientEntity = Types.Instance(Entities::DevelopmentCoefficient)
      ProbabilityEntity = Types.Instance(Entities::ProbabilityOfWin)
    end
  end
end
