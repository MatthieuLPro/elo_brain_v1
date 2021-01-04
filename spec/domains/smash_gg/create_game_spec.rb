# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  describe CreateGame do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(game: game) }
      context 'with valid parameters' do
        let(:game) { 'super_smash_bros_ultimate' }

        it 'returns a value from the dictionnary' do
          expect(subject).to eq('1386')
        end
      end
    end
  end
end
