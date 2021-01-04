# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Calculator
    module EloAfterMatch
      describe Winner do
        let(:instance) { described_class.new(current_elo: current_elo) }
        let(:current_elo) { 100 }
        let(:development_coefficient) { 10 }
        let(:probability_of_win) { 0.5 }

        describe '#call' do
          subject do
            instance.call(
              development_coefficient: development_coefficient,
              probability_of_win: probability_of_win
            )
          end

          it 'expected to be greater than current_elo' do
            expect(subject).to be > current_elo
          end
        end
      end
    end
  end
end
