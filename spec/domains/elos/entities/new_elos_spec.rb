# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Entities
    describe NewElos do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              winner_elo: 1,
              looser_elo: 1
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(described_class)
          end
        end
      end
    end
  end
end
