# frozen_string_literal: true

require 'rails_helper'

module Tournaments
  describe Tournament do
    let(:instance) { described_class }

    describe '#from_json' do
      subject { instance.from_json(tournament) }
      context 'with valid parameters' do
        let(:tournament) do
          {
            'name' => 'foo',
            'city' => 'bar',
            'startAt' => 1,
            'events' => [1, 2]
          }
        end

        it 'expected to create an object' do
          expect(subject.class).to eq(Tournaments::Tournament)
        end
      end
    end
  end
end
