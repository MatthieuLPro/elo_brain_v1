# frozen_string_literal: true

require 'rails_helper'

module Matches
  describe PlayerRole do
    let(:instance) { described_class.new(player1: player1, player2: player2) }
    let(:player_with_greater_score) do
      double
        .tap { |player| allow(player).to receive(:id) { 1 } }
        .tap { |player| allow(player).to receive(:score) { 3 } }
    end
    let(:player_with_lower_score) do
      double
        .tap { |player| allow(player).to receive(:id) { 2 } }
        .tap { |player| allow(player).to receive(:score) { 0 } }
    end

    describe '#winner' do
      subject { instance.winner_id }
      context 'with player1 has greater score than player2' do
        let(:player1) { player_with_greater_score }
        let(:player2) { player_with_lower_score }

        it 'expected to return the player1 id' do
          expect(subject).to eq(player1.id)
        end
      end
    end

    describe '#looser' do
      subject { instance.looser_id }
      context 'with player1 has greater score than player2' do
        let(:player1) { player_with_greater_score }
        let(:player2) { player_with_lower_score }

        it 'expected to return a float' do
          expect(subject).to eq(player2.id)
        end
      end
    end
  end
end
