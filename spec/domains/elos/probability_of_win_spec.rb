# frozen_string_literal: true

require 'rails_helper'

module Elos
  describe ProbabilityOfWin do
    let(:instance) { described_class.new }

    describe '#difference_of_elo' do
      subject { instance.call(difference_of_elo: difference_of_elo) }
      context 'with valid parameters' do
        let(:difference_of_elo) { 10_000.0 }

        it 'expected to return a float' do
          expect(subject.class).to eq(Float)
        end
      end

      context 'with very big negative difference' do
        let(:difference_of_elo) { -10_000.0 }

        it 'expected to be positive' do
          expect(subject.positive?).to eq(true)
        end
      end

      context 'with very big positive difference' do
        let(:difference_of_elo) { 10_000.0 }

        it 'expected to be below or equal to 1' do
          expect(subject <= 1).to eq(true)
        end
      end
    end
  end
end
