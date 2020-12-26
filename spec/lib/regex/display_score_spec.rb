# frozen_string_literal: true

require 'rails_helper'

module Regex
  describe DisplayScore do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(expression: expression) }
      context 'with valid expression' do
        let(:expression) { 'FOO | foo 1 - BAR | bar 2' }

        it 'expected to create an hash' do
          expect(subject[:player1_name]).to eq('foo')
          expect(subject[:player1_score]).to eq(1)
          expect(subject[:player2_name]).to eq('bar')
          expect(subject[:player2_score]).to eq(2)
        end
      end
    end
  end
end
