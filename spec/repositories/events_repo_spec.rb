# frozen_string_literal: true

require 'rails_helper'

describe EventsRepo do
  let(:instance) { described_class.new }
  let!(:event1) { FactoryBot.create(:event, name: 'foo', id: 1) }
  let!(:event2) { FactoryBot.create(:event, name: 'bar', id: 2) }

  describe '#index' do
    subject { instance.index }

    it 'finds all matches' do
      expect(subject.count).to eq(2)
    end
  end

  describe '#create_by' do
    subject { instance.create_by(name: name) }
    context 'with valid parameter' do
      let(:name) { 'oof' }

      it 'finds a match' do
        expect { subject }.to change { Event.count }.by(1)
      end
    end
  end
end
