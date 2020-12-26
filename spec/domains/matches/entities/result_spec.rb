# frozen_string_literal: true

require 'rails_helper'

module Matches
  module Entities
    describe Result do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              winner_id: 1,
              looser_id: 2
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(Matches::Entities::Result)
          end
        end
      end
    end
  end
end
