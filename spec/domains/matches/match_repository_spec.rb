# frozen_string_literal: true

require 'rails_helper'

module Matches
  describe MatchRepository do
    let(:instance) { described_class.new }
    let!(:event) { FactoryBot.create(:event, name: 'foo-event', id: 1) }
    let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
    let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }

    describe '#create' do
      subject { instance.create(event_id: event_id, winner_id: winner_id, looser_id: looser_id) }
      context 'with valid parameters' do
        let(:event_id) { 1 }
        let(:winner_id) { 1 }
        let(:looser_id) { 2 }

        it 'creates a match' do
          expect { subject }.to change { ::Match.count }.by(1)
        end
      end
    end

    describe '#nb_matches_by_elos' do
      subject { instance.nb_matches_by_elos(elos_collection: elos_collection) }
      context 'with many elos in collection' do
        let(:elos_collection) { double.tap { |elos| allow(elos).to receive(:count) { 1 } } }

        it 'expected to create an hash' do
          expect(subject).to eq(1)
        end
      end
    end
  end
end
