# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Dictionaries
    describe WithDictionary do
      let(:instance) { described_class.new(dictionary: dictionary) }
      let(:dictionary) { SmashGg::Dictionaries::Coordinates::LIST }

      describe '#translate' do
        subject { instance.translate(value: value) }
        context 'with an existing value' do
          let(:value) { 'paris' }

          it 'expected to return a value' do
            expect(subject).to_not be_nil
          end
        end

        context 'with an unknown value' do
          subject { instance.translate(value: value) }
          let(:value) { 'unknown_place' }

          it 'expected to not return a value' do
            expect(subject).to be_nil
          end
        end
      end
    end
  end
end
