# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Contracts
    describe NewElos do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            winner_elo: winner_elo,
            looser_elo: looser_elo
          )
        end
        context 'with valid parameters' do
          let(:winner_elo) { 1 }
          let(:looser_elo) { 1 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with winner_elo is not positive' do
          let(:winner_elo) { -1 }
          let(:looser_elo) { 1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end

        context 'with looser_elo is not positive' do
          let(:winner_elo) { 1 }
          let(:looser_elo) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end
      end
    end
  end
end
