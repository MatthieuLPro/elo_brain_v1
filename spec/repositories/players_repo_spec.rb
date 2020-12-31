# frozen_string_literal: true

require 'rails_helper'

describe PlayersRepo do
  let(:instance) { described_class.new }
  let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
  let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }

  describe '#index' do
    subject { instance.index }

    it 'finds all players' do
      expect(subject.count).to eq(2)
    end
  end

  describe '#create_with' do
    subject { instance.create_with(name: name) }
    context 'with valid parameter' do
      let(:name) { 'oof' }

      it 'creates a new player' do
        expect { subject }.to change { Player.count }.by(1)
      end
    end
  end

  describe '#find_by' do
    subject { instance.find_by(name: name) }
    context 'with valid parameter' do
      let(:name) { 'foo' }

      it 'returns an existing player' do
        expect(subject).to eq(player1)
      end
    end
  end
end
