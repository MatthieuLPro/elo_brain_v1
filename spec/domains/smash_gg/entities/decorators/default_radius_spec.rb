# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Entities
    module Decorators
      describe DefaultRadius do
        let(:instance) { described_class.new }

        describe '#call' do
          subject { instance.call(value: value) }
          context 'with parameter is nil' do
            let(:value) { nil }
            it 'expected to return default value' do
              expect(subject).to eq(DefaultRadius::DEFAULT_VALUE)
            end
          end

          context 'with parameter is empty' do
            let(:value) { '' }
            it 'expected to return default value' do
              expect(subject).to eq(DefaultRadius::DEFAULT_VALUE)
            end
          end

          context 'with valid parameter' do
            let(:value) { '1' }
            it 'expected to return the value' do
              expect(subject).to eq('1')
            end
          end
        end
      end
    end
  end
end
