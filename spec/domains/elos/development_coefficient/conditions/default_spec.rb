# frozen_string_literal: true

require 'rails_helper'

module Elos
  module DevelopmentCoefficient
    module Conditions
      describe Default do
        let(:instance) { described_class.new }

        describe '#eligible?' do
          subject { instance.eligible? }
          context 'is always true' do
            it 'expected to be true' do
              expect(subject).to eq(true)
            end
          end
        end
      end
    end
  end
end
