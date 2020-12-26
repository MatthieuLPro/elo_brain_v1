# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Entities
    describe Player do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              id: 1,
              name: 'foo',
              score: 2
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(Matches::Entities::Player)
          end
        end
      end
    end
  end
end
