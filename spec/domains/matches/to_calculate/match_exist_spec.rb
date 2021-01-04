# frozen_string_literal: true

require 'rails_helper'

module Matches
  module ToCalculate
    describe MatchExist do
      let(:instance) { described_class.new }

      describe '#call' do
        subject { instance.call(match_information: match_information) }
        context 'all the conditions are true' do
          let(:match_information) { 1 }
          it 'expected to not be the default value' do
            expect(subject).to be_truthy
          end
        end

        context 'one of the condition is false' do
          let(:match_information) { nil }
          it 'expected to not be the default value' do
            expect(subject).to be_falsey
          end
        end
      end
    end
  end
end
