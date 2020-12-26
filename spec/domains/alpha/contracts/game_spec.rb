# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Contracts
    describe Game do
      let(:instance) { described_class.new }

      describe '#call' do
        subject { instance.call(game_id: game_id) }
        context 'with valid parameters' do
          let(:game_id) { '1' }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with game_id is not in specific length' do
          let(:game_id) { '123456' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be in a length between 1 and 4 (include)')
          end
        end

        context 'with game_id negative' do
          let(:game_id) { '-1' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'with game_id equal to zero' do
          let(:game_id) { '0' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end
      end
    end
  end
end
