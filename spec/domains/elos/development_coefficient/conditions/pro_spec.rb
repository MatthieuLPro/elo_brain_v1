# frozen_string_literal: true

require 'rails_helper'

module Elos
  module DevelopmentCoefficient
    module Conditions
      describe Pro do
        let(:instance) { described_class.new(elo: elo) }

        describe '#eligible?' do
          subject { instance.eligible? }
          context 'elo is under ELO_MIN' do
            let(:elo) { 1_000 }
            it 'expected to be false' do
              expect(subject).to eq(false)
            end
          end

          context 'elo is over ELO_MIN' do
            let(:elo) { 2_500 }
            it 'expected to be true' do
              expect(subject).to eq(true)
            end
          end
        end
      end
    end
  end
end
