# frozen_string_literal: true

require 'rails_helper'

module Players
  describe FindOrCreate do
    let(:instance) { described_class.new }
    let!(:player) { FactoryBot.create(:player, name: 'foo', id: 1) }

    describe '#call' do
      subject { instance.call(name: name) }
      context 'is looking for an existing player' do
        let(:name) { 'foo' }

        it 'returns an existing player' do
          expect(subject.id).to eq(player.id)
        end
      end

      context 'is looking for a non existing player' do
        let(:name) { 'bar' }

        it 'returns new player' do
          expect(subject.id).to_not eq(player.id)
        end
      end
    end
  end
end
