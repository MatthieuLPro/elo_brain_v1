# frozen_string_literal: true

require 'rails_helper'

module Alpha
  module Contracts
    describe DatesRange do
      let(:instance) { described_class.new }

      describe '#call' do
        subject { instance.call(before_date: before_date, after_date: after_date) }
        context 'with valid parameters' do
          let(:before_date) { (Time.now.to_i - 1_000).to_s }
          let(:after_date) { (Time.now.to_i - 2_000).to_s }
          it 'expected to does not have an error' do
            expect(subject.errors.to_h.empty?).to eq(true)
          end
        end

        context 'with before_date in wrong format' do
          let(:before_date) { '1234' }
          let(:after_date) { (Time.now.to_i - 1_000).to_s }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be in timestamp format')
          end
        end

        context 'with before_date in the future' do
          let(:before_date) { (Time.now.to_i + 1_000).to_s }
          let(:after_date) { (Time.now.to_i - 1_000).to_s }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must not be in the future')
          end
        end

        context 'with after_date in wrong format' do
          let(:before_date) { (Time.now.to_i - 2_000).to_s }
          let(:after_date) { '1234' }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must be in timestamp format')
          end
        end

        context 'with after_date in the future' do
          let(:before_date) { (Time.now.to_i - 2_000).to_s }
          let(:after_date) { (Time.now.to_i + 1_000).to_s }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('must not be in the future')
          end
        end

        context 'with after_date after before_date' do
          let(:before_date) { (Time.now.to_i - 2_000).to_s }
          let(:after_date) { (Time.now.to_i - 1_000).to_s }
          it 'expected to has errors' do
            expect(subject.errors.messages.first.text).to eq('after_date must be before before_date')
          end
        end
      end
    end
  end
end
