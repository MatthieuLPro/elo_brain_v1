# frozen_string_literal: true

require 'rails_helper'

module Elos
  describe NewElos do
    let(:instance) { described_class.new(winner_information: winner_information, looser_information: looser_information) }

    describe '#call' do
      subject { instance.call }
      context 'parameters are valid' do
        let(:winner_information) { Players::Entities::Information.new(id: 1, nb_matches: 12, current_elo: 1_400) }
        let(:looser_information) { Players::Entities::Information.new(id: 2, nb_matches: 24, current_elo: 1_500) }
        it 'expected to create an entity' do
          expect(subject.class).to eq(Entities::NewElos)
        end
      end
    end
  end
end
