# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Calculator
    module DevelopmentCoefficient
      module Conditions
        describe Amateur do
          let(:instance) { described_class.new(elo: elo) }

          describe '#eligible?' do
            subject { instance.eligible? }
            context 'elo is below ELO_MAX' do
              let(:elo) { 1_000 }

              it 'expected to be true' do
                expect(subject).to eq(true)
              end
            end

            context 'elo is over ELO_MAX' do
              let(:elo) { 2_500 }

              it 'expected to be false' do
                expect(subject).to eq(false)
              end
            end
          end
        end
      end
    end
  end
end
