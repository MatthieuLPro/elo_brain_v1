# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Entities
    describe Match do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              player1_name: 'foo',
              player1_score: 1,
              player2_name: 'bar',
              player2_score: 2
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(Matches::Entities::Match)
          end
        end
      end
    end
  end
end
