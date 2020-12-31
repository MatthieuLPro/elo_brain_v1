# frozen_string_literal: true

require 'rails_helper'

describe RankingsRepo do
  let(:instance) { described_class.new }
  let!(:game) { FactoryBot.create(:game, name: 'game_name', id: 1) }
  let!(:ranking1) { FactoryBot.create(:ranking, game: game, start_date: Date.today, end_date: Date.today + 1.day, id: 1) }
  let!(:ranking2) { FactoryBot.create(:ranking, game: game, start_date: Date.today, end_date: Date.today + 1.day, id: 2) }

  describe '#index' do
    subject { instance.index }

    it 'finds all rankings' do
      expect(subject.count).to eq(2)
    end
  end

  describe '#create_by' do
    subject { instance.create_by(game: current_game, start_date: start_date, end_date: end_date) }
    context 'with valid parameter' do
      let(:current_game) { game }
      let(:start_date) { Date.today }
      let(:end_date) { Date.today + 1.day }

      it 'creates a new ranking' do
        expect { subject }.to change { Ranking.count }.by(1)
      end
    end
  end

  describe '#find_by' do
    subject { instance.find_by(game: current_game, start_date: start_date, end_date: end_date) }
    context 'with valid parameter' do
      let(:current_game) { game }
      let(:start_date) { ranking1.start_date }
      let(:end_date) { ranking1.end_date }

      it 'finds an existing ranking' do
        expect(subject).to eq(ranking1)
      end
    end
  end
end
