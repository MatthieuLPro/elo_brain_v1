# frozen_string_literal: true

require 'rails_helper'

module Players
  module Entities
    module Decorators
      describe DefaultElo do
        let(:instance) { described_class.new }

        describe '#call' do
          subject { instance.call(value: value) }
          context 'with count of value is equal to zero' do
            let(:value) { double.tap { |elo| allow(elo).to receive(:count) { 0 } } }
            it 'expected to return default value' do
              expect(subject).to eq(::Elo::STARTING_ELO)
            end
          end

          context 'with count of value is different to zero' do
            let(:value) do
              double
                .tap { |elo| allow(elo).to receive(:count) { 1 } }
                .tap { |elo| allow(elo).to receive(:last_level) { 1_000 } }
            end
            it 'expected to return the last value of elo' do
              expect(subject).to eq(1_000)
            end
          end
        end
      end
    end
  end
end
