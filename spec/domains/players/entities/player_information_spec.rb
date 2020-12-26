# frozen_string_literal: true

require 'rails_helper'

module Players
  module Entities
    describe PlayerInformation do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              nb_matches: 1,
              current_elo: 2
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(Players::Entities::PlayerInformation)
          end
        end
      end
    end
  end
end
