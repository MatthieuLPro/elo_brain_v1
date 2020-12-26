# frozen_string_literal: true

require 'rails_helper'

module Regex
  describe ScoreInDisplayScore do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(expression: expression) }
      context 'with valid expression' do
        let(:expression) { '2' }

        it 'expected to convert the string into integer' do
          expect(subject).to eq(2)
        end
      end
    end
  end
end
