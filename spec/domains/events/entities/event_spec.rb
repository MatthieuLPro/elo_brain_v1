# frozen_string_literal: true

require 'rails_helper'

module Events
  module Entities
    describe Event do
      let(:instance) { described_class }

      describe '#from_json' do
        subject { instance.from_json(event) }
        context 'with valid parameters' do
          let(:event) do
            {
              'id' => 1,
              'numEntrants' => 2,
              'sets' => { 'nodes' => [] }
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
