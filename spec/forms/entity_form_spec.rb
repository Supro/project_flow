require 'rails_helper'

RSpec.describe EntityForm do
  let(:form) { EntityForm.new(name: 'Some', sum: 10, statuses: %w(in_time in_time)) }

  it 'should have fields fields' do
    expect(form.name).to eq 'Some'
    expect(form.statuses.length).to eq 2
    expect(form.sum).to eq 10
  end

  it '#entity' do
    expect(form.entity.class).to eq Entity
  end

  it '#statuses' do
    expect(form.statuses).to_not be_empty
  end
end
