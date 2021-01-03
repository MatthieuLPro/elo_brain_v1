# frozen_string_literal: true

require 'rails_helper'

module Elos
  module Calculator
    module DevelopmentCoefficient
      module Conditions
        describe Starting do
          let(:instance) { described_class.new(nb_matches: nb_matches) }

          describe '#eligible?' do
            subject { instance.eligible? }
            context 'nb of matches is under NB_MAXIMUM_MATCHES' do
              let(:nb_matches) { 25 }
              it 'expected to be true' do
                expect(subject).to eq(true)
              end
            end

            context 'nb of matches is over NB_MAXIMUM_MATCHES' do
              let(:nb_matches) { 35 }
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
