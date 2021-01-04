# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  describe CreateCoordinates do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(place: place) }
      context 'with valid parameters' do
        let(:place) { 'paris' }

        it 'returns a value from the dictionnary' do
          expect(subject).to eq('48.8534,2.3488')
        end
      end
    end
  end
end
