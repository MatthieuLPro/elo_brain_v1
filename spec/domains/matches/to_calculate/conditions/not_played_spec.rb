# frozen_string_literal: true

require 'rails_helper'

module Matches
  module ToCalculate
    module Conditions
      describe NotPlayed do
        let(:instance) { described_class.new(match_information: match_information) }

        describe '#played?' do
          subject { instance.played? }
          context 'match is played' do
            let(:match_information) { 1 }

            it 'expected to be true' do
              expect(subject).to eq(true)
            end
          end

          context 'match is not played' do
            let(:match_information) { 'DQ' }

            it 'expected to be false' do
              expect(subject).to eq(false)
            end
          end
        end
      end
    end
  end
end
