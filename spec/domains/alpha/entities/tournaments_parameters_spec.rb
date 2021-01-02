# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Entities
    describe TournamentsParameters do
      let(:instance) { described_class }

      describe '#from_contract' do
        subject { instance.from_contract(contract: contract) }
        context 'with valid parameters' do
          let(:contract) do
            {
              events_per_page: 10,
              area: Alpha::Entities::Area.new(coordinates: 'foo', radius: 'bar'),
              dates_range: Alpha::Entities::DatesRange.new(before_date: 'oof', after_date: 'rab'),
              game: Alpha::Entities::Game.new(id: '1')
            }
          end

          it 'expected to create an object' do
            expect(subject.class).to eq(Alpha::Entities::TournamentsParameters)
          end
        end
      end
    end
  end
end
