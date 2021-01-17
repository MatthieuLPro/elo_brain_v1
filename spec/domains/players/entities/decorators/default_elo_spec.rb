# frozen_string_literal: true

require 'rails_helper'

module Players
  module Entities
    module Decorators
      describe DefaultElo do
        let(:instance) { described_class.new }

        describe '#call' do
          subject { instance.call(value: value) }
          context 'with player has no elos associations' do
            let(:value) { nil }
            it 'expected to return default value' do
              expect(subject).to eq(::Elo::STARTING_ELO)
            end
          end

          context 'with player is associated with an elo' do
            let(:value) do
              double
                .tap { |elo| allow(elo).to receive(:nil) { false } }
                .tap { |elo| allow(elo).to receive(:level) { 1_000 } }
            end
            it 'expected to return the level of elo' do
              expect(subject).to eq(1_000)
            end
          end
        end
      end
    end
  end
end
