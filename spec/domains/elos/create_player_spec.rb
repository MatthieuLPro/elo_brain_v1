# frozen_string_literal: true

require 'rails_helper'

module Elos
  describe CreatePlayer do
    let(:instance) { described_class.new(information: information, coefficient: coefficient, probability: probability) }

    describe '#call' do
      subject { instance.call }
      context 'parameters are valid' do
        let(:information) { Players::Entities::Information.new(id: 1, nb_matches: 2, current_elo: 3) }
        let(:coefficient) { Elos::Entities::DevelopmentCoefficient.new(coefficient: 1) }
        let(:probability) { Elos::Entities::ProbabilityOfWin.new(probability: 1.0) }
        it 'expected to create an entity' do
          expect(subject.class).to eq(Entities::Player)
        end
      end
    end
  end
end
