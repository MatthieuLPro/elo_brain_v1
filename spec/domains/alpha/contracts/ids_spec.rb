# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Contracts
    describe Id do
      let(:instance) { described_class.new }

      describe '#call' do
        subject { instance.call(number: number) }
        context 'with valid parameters' do
          let(:number) { 1 }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'is negative' do
          let(:number) { -1 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end

        context 'is equal to zero' do
          let(:number) { 0 }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be positive')
          end
        end
      end
    end
  end
end
