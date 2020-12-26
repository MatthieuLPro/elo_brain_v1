# frozen_string_literal: true

require 'rails_helper'

module STRING
  describe NameInDisplayScore do
    let(:instance) { described_class.new }

    describe '#call' do
      subject { instance.call(expression: expression) }
      context 'with valid expression' do
        let(:expression) { 'foo | bar' }

        it 'expected to split and get last value' do
          expect(subject).to eq('bar')
        end
      end
    end
  end
end
