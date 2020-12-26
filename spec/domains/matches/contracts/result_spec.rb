# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Contracts
    describe Result do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            winner_id: winner_id,
            looser_id: looser_id
          )
        end
        context 'with valid parameters' do
          let(:winner_id) { 1 }
          let(:looser_id) { 2 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with winner_id is negative' do
          let(:winner_id) { -1 }
          let(:looser_id) { 1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'with looser_id is negative' do
          let(:winner_id) { 1 }
          let(:looser_id) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'with winner_id is equal to looser_id' do
          let(:winner_id) { 1 }
          let(:looser_id) { 1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be different')
          end
        end
      end
    end
  end
end
