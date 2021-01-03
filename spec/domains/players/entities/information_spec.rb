# frozen_string_literal: true

require 'rails_helper'

module Players
  module Entities
    describe Information do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              id: 1,
              nb_matches: 2,
              current_elo: 3
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
