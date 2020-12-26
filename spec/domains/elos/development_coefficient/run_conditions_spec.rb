# frozen_string_literal: true

require 'rails_helper'

module Elos
  module DevelopmentCoefficient
    describe RunConditions do
      let(:instance) { described_class.new(default_condition, conditions_list) }
      let(:truthy_condition) { double.tap { |condition| allow(condition).to receive(:eligible?) { true } } }
      let(:falsey_condition) { double.tap { |condition| allow(condition).to receive(:eligible?) { false } } }

      describe '#condition' do
        subject { instance.condition }
        context 'one of the condition is true' do
          let(:conditions_list) { truthy_condition }
          let(:default_condition) { falsey_condition }
          it 'expected to return the condition' do
            expect(subject).to eq(truthy_condition)
          end
        end

        context 'noone of the condition is true' do
          let(:conditions_list) { falsey_condition }
          let(:default_condition) { truthy_condition }
          it 'expected to return the default condition' do
            expect(subject).to eq(truthy_condition)
          end
        end
      end
    end
  end
end
