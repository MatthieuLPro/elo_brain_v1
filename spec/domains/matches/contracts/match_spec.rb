# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Contracts
    describe Match do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            player1_name: player1_name,
            player1_score: player1_score,
            player2_name: player2_name,
            player2_score: player2_score
          )
        end
        context 'with valid parameters' do
          let(:player1_name) { 'foo' }
          let(:player1_score) { 1 }
          let(:player2_name) { 'bar' }
          let(:player2_score) { 2 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with player1_score is negative' do
          let(:player1_name) { 'foo' }
          let(:player1_score) { -1 }
          let(:player2_name) { 'bar' }
          let(:player2_score) { 2 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end

        context 'with player2_score is negative' do
          let(:player1_name) { 'foo' }
          let(:player1_score) { -1 }
          let(:player2_name) { 'bar' }
          let(:player2_score) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end

        context 'with player1_score and player2_score are equals' do
          let(:player1_name) { 'foo' }
          let(:player1_score) { 1 }
          let(:player2_name) { 'bar' }
          let(:player2_score) { 1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be different')
          end
        end

        context 'with player1_name and player2_name are equals' do
          let(:player1_score) { 1 }
          let(:player2_score) { 2 }
          let(:player1_name) { 'foo' }
          let(:player2_name) { 'foo' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be different')
          end
        end
      end
    end
  end
end
