# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Contracts
    describe TournamentsParameters do
      let(:instance) { described_class.new }
      let(:area) { Alpha::Entities::Area.new(coordinates: 'foo', radius: 'bar') }
      let(:dates_range) { Alpha::Entities::DatesRange.new(before_date: 'oof', after_date: 'rab') }
      let(:game) { Alpha::Entities::Game.new(id: 'ofo') }

      describe '#call' do
        subject { instance.call(events_per_page: events_per_page, area: area, dates_range: dates_range, game: game) }

        context 'with valid parameters' do
          let(:events_per_page) { 10 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'events per_page is negative' do
          let(:events_per_page) { -10 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'events_per_page is over 100' do
          let(:events_per_page) { 1_000 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be below 100')
          end
        end
      end
    end
  end
end
