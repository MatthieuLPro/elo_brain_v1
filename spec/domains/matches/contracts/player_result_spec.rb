# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Contracts
    describe PlayerResult do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            id: id,
            score: score
          )
        end
        context 'with valid parameters' do
          let(:id) { 1 }
          let(:score) { 2 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with id is negative' do
          let(:id) { -1 }
          let(:score) { 2 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'with score is negative' do
          let(:id) { 1 }
          let(:score) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end
      end
    end
  end
end
