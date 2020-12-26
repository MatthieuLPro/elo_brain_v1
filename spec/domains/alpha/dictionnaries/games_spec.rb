# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Dictionaries
    describe Games do
      let(:instance) { described_class }

      describe '#LIST' do
        subject { instance::LIST }
        it 'expected to return an hash' do
          expect(subject.class).to eq(Hash)
        end

        it 'expected to return a string' do
          expect(subject[:tekken7].class).to eq(String)
        end

        it 'expected to return an id' do
          expect(subject[:tekken7]).to eq('17')
        end
      end
    end
  end
end
