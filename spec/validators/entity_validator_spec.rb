require 'rails_helper'

RSpec.describe EntityValidator do
  let(:params) { { name: 'Some', sum: 10, statuses: %w(in_time in_time) } }

  let(:validator) { EntityValidator.new(params, 2) }

  it '#success' do
    expect(validator.success?).to be_truthy
  end

  it '#errors' do
    expect(validator.errors).to be_empty
  end

  context 'invalid params' do
    context 'without name' do
      let(:params) { { statuses: %w(in_time in_time), sum: 10 } }

      it 'should validate' do
        expect(validator.success?).to be_falsey
        expect(validator.errors[:name]).to be
      end
    end

    context 'without sum' do
      let(:params) { { name: 'Some', statuses: %w(in_time in_time) } }

      it 'should validate' do
        expect(validator.success?).to be_falsey
        expect(validator.errors[:sum]).to eq ['is missing']
      end
    end

    context 'without statuses' do
      let(:params) { { name: 'Some', sum: 10 } }

      it 'should validate' do
        expect(validator.success?).to be_falsey
        expect(validator.errors[:statuses]).to eq ['is missing']
      end
    end

    context 'statuses no in list' do
      let(:params) { { name: 'Some', sum: 10, statuses: %w(hello hello) } }

      it 'should validate' do
        expect(validator.success?).to be_falsey
        expect(validator.errors[:statuses]).to eq ['must be one of in_time, delay, premature']
      end
    end

    context 'invalid statuses count' do
      let(:params) { { name: 'Some', sum: 10, statuses: %w(in_time) } }

      it 'should validate' do
        expect(validator.success?).to be_falsey
        expect(validator.errors[:statuses]).to eq ['size must be 2']
      end
    end
  end
end
