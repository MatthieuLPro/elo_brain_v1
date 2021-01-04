# frozen_string_literal: true

require 'rails_helper'

module Players
  describe CreateInformation do
    let(:instance) { described_class.new(player_id: player1.id) }
    let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }

    describe '#call' do
      subject { instance.call }
      context 'parameter is valid' do
        it 'creates an information entity' do
          expect(subject.class).to eq(Entities::Information)
        end
      end
    end
  end
end
