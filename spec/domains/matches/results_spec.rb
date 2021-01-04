# frozen_string_literal: true

require 'rails_helper'

module Matches
  describe Results do
    let(:instance) { described_class.new }
    let(:match_result) do
      double
        .tap { |winner| allow(winner).to receive(:winner_id) { 1 } }
        .tap { |looser| allow(looser).to receive(:looser_id) { 2 } }
    end
    let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
    let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }

    describe '#call' do
      subject { instance.call(result: result) }
      context 'without specific NewElos class' do
        let(:result) { match_result }

        it 'expected to create an NewElos entity' do
          expect(subject.class).to eq(Elos::Entities::NewElos)
        end

        it 'expected to has a winner' do
          expect(subject[:winner]).to_not be_nil
        end

        it 'expected to has a looser' do
          expect(subject[:looser]).to_not be_nil
        end
      end
    end
  end
end
