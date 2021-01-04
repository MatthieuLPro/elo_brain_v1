# frozen_string_literal: true

require 'rails_helper'

describe AdminConstraint do
  let(:instance) { described_class.new }
  let!(:user) { FactoryBot.create(:user, name: 'foo', password: 's3cur3d_p4ssw0rd', id: 1) }

  describe '#matches?' do
    subject { instance.matches?(request) }
    context 'with valid request' do
      let!(:request) { double.tap { |request| allow(request).to receive(:session) { { user_id: 1 } } } }

      it 'expected to find the logged user' do
        expect(subject.id).to eq(1)
      end
    end

    context 'with non-valid expression' do
      let!(:request) { double.tap { |request| allow(request).to receive(:session) { { user_id: nil } } } }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end
end
