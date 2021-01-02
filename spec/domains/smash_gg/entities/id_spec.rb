# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Entities
    describe Id do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              number: 1
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(SmashGg::Entities::Id)
          end
        end
      end
    end
  end
end
