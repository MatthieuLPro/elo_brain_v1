# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Entities
    describe EventParameters do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              events_per_page: 10,
              event_id: SmashGg::Entities::Id.new(number: 1)
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(SmashGg::Entities::EventParameters)
          end
        end
      end
    end
  end
end
