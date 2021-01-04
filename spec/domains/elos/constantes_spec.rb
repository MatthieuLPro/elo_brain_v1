# frozen_string_literal: true

require 'rails_helper'

module Elos
  describe Constantes do
    let(:instance) { described_class.new(nb_matches: nb_matches, player_elo: player_elo, opponent_elo: opponent_elo) }

    describe '#development_coefficient' do
      subject { instance.development_coefficient }
      context 'parameters are valid' do
        let(:nb_matches) { 1 }
        let(:player_elo) { 2 }
        let(:opponent_elo) { 3 }
        it 'expected to create an entity' do
          expect(subject.class).to eq(Entities::DevelopmentCoefficient)
        end
      end
    end

    describe '#probability_of_win' do
      subject { instance.probability_of_win }
      context 'parameters are valid' do
        let(:nb_matches) { 1 }
        let(:player_elo) { 2 }
        let(:opponent_elo) { 3 }
        it 'expected to create an entity' do
          expect(subject.class).to eq(Entities::ProbabilityOfWin)
        end
      end
    end
  end
end
