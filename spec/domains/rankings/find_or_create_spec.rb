# frozen_string_literal: true

require 'rails_helper'

module Rankings
  describe FindOrCreate do
    let(:instance) { described_class.new(game: game, event_date: event_date) }
    let!(:game) { FactoryBot.create(:game, name: 'game_name', id: 1) }
    let!(:ranking1) { FactoryBot.create(:ranking, game: game, start_date: Date.today.beginning_of_year, end_date: Date.today.end_of_year, id: 1) }

    describe '#call' do
      subject { instance.call }
      context 'with valid date' do
        let!(:event_date) { Date.today }

        it 'returns an existing ranking' do
          expect(subject).to eq(ranking1)
        end
      end

      context 'with unvalid date' do
        let!(:event_date) { Date.today - 1.year }

        it 'creates a new ranking' do
          expect { subject }.to change { Ranking.count }.by(1)
        end
      end
    end
  end
end
