# frozen_string_literal: true

require 'rails_helper'

module SmashGg
  module Contracts
    describe Area do
      let(:instance) { described_class.new }

      describe '#call' do
        subject { instance.call(coordinates: coordinates, radius: radius) }
        context 'with valid parameters' do
          let(:coordinates) { '48.8534,2.3488' }
          let(:radius) { '31mi' }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with online instead of coordinates' do
          let(:coordinates) { 'online' }
          let(:radius) { '31mi' }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with non-valid coordinates' do
          let(:coordinates) { 'AAAA' }
          let(:radius) { '31mi' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be in coordinate format or to be online')
          end
        end

        context 'with non-valid radius' do
          let(:coordinates) { '48.8534,2.3488' }
          let(:radius) { '31mAAA' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be in radius format')
          end
        end
      end
    end
  end
end
