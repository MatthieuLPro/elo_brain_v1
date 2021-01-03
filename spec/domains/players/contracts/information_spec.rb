# frozen_string_literal: true

require 'rails_helper'

module Players
  module Contracts
    describe Information do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            id: id,
            nb_matches: nb_matches,
            current_elo: current_elo
          )
        end
        context 'with valid parameters' do
          let(:id) { 1 }
          let(:nb_matches) { 2 }
          let(:current_elo) { 3 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with id is not positive' do
          let(:id) { 0 }
          let(:nb_matches) { 1 }
          let(:current_elo) { 2 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'with nb_matches is not positive or zero' do
          let(:id) { 1 }
          let(:nb_matches) { -1 }
          let(:current_elo) { 2 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end

        context 'with current_elo is not positive' do
          let(:id) { 1 }
          let(:nb_matches) { 2 }
          let(:current_elo) { 0 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end
      end
    end
  end
end
