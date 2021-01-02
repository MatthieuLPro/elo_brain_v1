# frozen_string_literal: true

require 'rails_helper'

describe MatchesRepo do
  let(:instance) { described_class.new }
  let!(:event1) { FactoryBot.create(:event, name: 'foo-event', id: 1) }
  let!(:event2) { FactoryBot.create(:event, name: 'bar-event', id: 2) }

  let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
  let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }
  let!(:player3) { FactoryBot.create(:player, name: 'oof', id: 3) }

  let!(:match1) { FactoryBot.create(:match, event: event1, winner: player1, looser: player2, completed_at: Time.now) }
  let!(:match2) { FactoryBot.create(:match, event: event2, winner: player2, looser: player3, completed_at: Time.now) }

  describe '#index' do
    subject { instance.index }

    it 'finds all matches' do
      expect(subject.count).to eq(2)
    end
  end

  describe '#index_per_event' do
    subject { instance.index_per_event(event_id: event_id) }
    context 'with valid parameter' do
      let(:event_id) { 1 }

      it 'finds a match' do
        expect(subject.count).to eq(1)
      end
    end
  end

  describe '#index_per_player' do
    subject { instance.index_per_player(player_id: player_id) }
    context 'with valid parameter' do
      let(:player_id) { 1 }

      it 'finds a match' do
        expect(subject.count).to eq(1)
      end
    end
  end

  describe '#create_from' do
    subject { instance.create_from(event_id: event_id, winner_id: winner_id, looser_id: looser_id, completed_at: completed_at) }
    context 'with valid parameters' do
      let(:event_id) { 1 }
      let(:winner_id) { 1 }
      let(:looser_id) { 2 }
      let(:completed_at) { Time.now }

      it 'creates a match' do
        expect { subject }.to change { ::Match.count }.by(1)
      end
    end
  end

  describe '#nb_matches_by' do
    subject { instance.nb_matches_by(elos_collection: elos_collection) }
    context 'with many elos in collection' do
      let(:elos_collection) { double.tap { |elos| allow(elos).to receive(:count) { 1 } } }

      it 'expected to create an hash' do
        expect(subject).to eq(1)
      end
    end
  end
end
