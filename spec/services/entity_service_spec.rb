require 'rails_helper'

RSpec.describe EntityValidator do
  let(:attributes) { { name: 'Some', sum: 10, statuses: %w(in_time in_time in_time in_time in_time in_time) } }
  let(:params) { ActionController::Parameters.new(entity: attributes) }

  let(:service) { EntityService.new(params) }

  before do
    create :condition
  end

  it '#save' do
    service.save
    expect(service.entity).to be_persisted
    expect(service.entity.investment).to be_persisted
    expect(service.entity.investment.periods.count).to eq 6
  end

  context 'invalid params' do
    let(:attributes) { { name: 'Some', sum: 10, statuses: %w(in_time) } }

    it '#save' do
      expect { service.save }.to change { Entity.count }.by(0)
    end
  end
end
