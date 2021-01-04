# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  describe CreateRadius do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(radius: radius) }
      context 'with valid parameters' do
        let(:radius) { '1' }

        it 'returns a decorated value' do
          expect(subject).to eq('1')
        end
      end
    end
  end
end
