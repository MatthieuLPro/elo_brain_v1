# frozen_string_literal: true

require 'rails_helper'

describe ElosRepo do
  let(:instance) { described_class.new }
  let!(:event1) { FactoryBot.create(:event, name: 'foo-event', id: 1) }

  let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
  let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }

  let!(:match1) { FactoryBot.create(:match, event: event1, winner: player1, looser: player2, id: 1) }

  let!(:elo1) { FactoryBot.create(:elo, match: match1, player: player1, level: 1_000)}
  let!(:elo2) { FactoryBot.create(:elo, match: match1, player: player2, level: 1_100)}

  describe '#index' do
    subject { instance.index }

    it 'finds all elos' do
      expect(subject.count).to eq(2)
    end
  end

  describe '#index_per_player' do
    subject { instance.index_per_player(player_id: player_id) }
    context 'with valid parameter' do
      let(:player_id) { 1 }

      it 'finds the player elos' do
        expect(subject.count).to eq(1)
      end
    end
  end

  describe '#index_per_match' do
    subject { instance.index_per_match(match_id: match_id) }
    context 'with valid parameter' do
      let(:match_id) { 1 }

      it 'finds the match elos' do
        expect(subject.count).to eq(2)
      end
    end
  end

  describe '#create_from' do
    subject { instance.create_from(player_id: player_id, level: level, match_id: match_id) }
    context 'with valid parameters' do
      let(:player_id) { 1 }
      let(:level) { 1_200 }
      let(:match_id) { 1 }

      it 'creates a elo' do
        expect { subject }.to change { Elo.count }.by(1)
      end
    end
  end

  # describe '#elos_by_player' do
  #   subject { instance.nb_matches_by(elos_collection: elos_collection) }
  #   context 'with many elos in collection' do
  #     let(:elos_collection) { double.tap { |elos| allow(elos).to receive(:count) { 1 } } }
  #
  #     it 'expected to create an hash' do
  #       expect(subject).to eq(1)
  #     end
  #   end
  # end
end
