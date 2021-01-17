# frozen_string_literal: true

require 'rails_helper'

describe ElosRepo do
  let(:instance) { described_class.new }
  let!(:event1) { FactoryBot.create(:event, name: 'foo-event', id: 1) }

  let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
  let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }

  let!(:match1) { FactoryBot.create(:match, event: event1, winner: player1, looser: player2, id: 1, completed_at: Time.now) }

  let!(:elo1) { FactoryBot.create(:elo, match: match1, player: player1, level: 1_000) }
  let!(:elo2) { FactoryBot.create(:elo, match: match1, player: player2, level: 1_100) }

  describe '#index_per_player' do
    subject { instance.index_per_player(player_id: player_id) }
    context 'with valid parameter' do
      let(:player_id) { 1 }

      it 'creates a list of entities' do
        expect(subject.class).to eq(Array)
        expect(subject.first.class).to eq(::Elos::Entities::Elo)
      end

      it 'finds the player elos' do
        expect(subject.count).to eq(1)
      end
    end
  end

  describe '#create_from' do
    subject { instance.create_from(player_id: player_id, level: level, match_id: match_id) }
    context 'with valid parameters' do
      let(:player_id) { 1 }
      let(:level) { 1_200 }
      let(:match_id) { 1 }

      it 'create an entity' do
        expect(subject.class).to eq(::Elos::Entities::Elo)
      end

      it 'creates a elo' do
        expect { subject }.to change { Elo.count }.by(1)
      end
    end
  end
end
