# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Contracts
    describe DevelopmentCoefficient do
      let(:instance) { described_class.new }

      describe '#call' do
        subject do
          instance.call(
            coefficient: coefficient
          )
        end
        context 'with valid parameters' do
          let(:coefficient) { 1 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with coefficient is not positive' do
          let(:coefficient) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be zero or positive')
          end
        end
      end
    end
  end
end