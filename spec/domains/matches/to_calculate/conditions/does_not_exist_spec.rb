# frozen_string_literal: true

require 'rails_helper'

module Matches
  module ToCalculate
    module Conditions
      describe DoesNotExist do
        let(:instance) { described_class.new(match_information: match_information) }

        describe '#played?' do
          subject { instance.played? }
          context 'information on the match exist' do
            let(:match_information) { 1 }

            it 'expected to be true' do
              expect(subject).to eq(true)
            end
          end

          context 'information on the match does not exist' do
            let(:match_information) { nil }

            it 'expected to be false' do
              expect(subject).to eq(false)
            end
          end
        end
      end
    end
  end
end
