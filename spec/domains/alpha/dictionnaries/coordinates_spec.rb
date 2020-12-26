# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Dictionaries
    describe Coordinates do
      let(:instance) { described_class }

      describe '#LIST' do
        subject { instance::LIST }
        it 'expected to return an hash' do
          expect(subject.class).to eq(Hash)
        end

        it 'expected to return a string' do
          expect(subject[:paris].class).to eq(String)
        end

        it 'expected to return a coordinate' do
          expect(subject[:paris]).to eq('48.8534,2.3488')
        end

        it 'expected to return the value online' do
          expect(subject[:online]).to eq('online')
        end
      end
    end
  end
end
