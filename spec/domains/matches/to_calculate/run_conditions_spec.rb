# frozen_string_literal: true

require 'rails_helper'

module Matches
  module ToCalculate
    describe RunConditions do
      let(:instance) { described_class.new(*conditions_list) }
      let(:truthy_condition) { double.tap { |condition| allow(condition).to receive(:played?) { true } } }
      let(:falsey_condition) { double.tap { |condition| allow(condition).to receive(:played?) { false } } }

      describe '#played?' do
        subject { instance.played? }
        context 'all conditions are true' do
          let(:conditions_list) { [truthy_condition, truthy_condition, truthy_condition] }
          it 'expected to return true' do
            expect(subject).to be_truthy
          end
        end

        context 'one of the condition is false' do
          let(:conditions_list) { [truthy_condition, truthy_condition, falsey_condition] }
          it 'expected to return false' do
            expect(subject).to be_falsey
          end
        end
      end
    end
  end
end
