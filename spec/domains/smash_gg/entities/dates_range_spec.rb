# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Entities
    describe DatesRange do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              before_date: 'foo',
              after_date: 'bar'
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(SmashGg::Entities::DatesRange)
          end
        end
      end
    end
  end
end
