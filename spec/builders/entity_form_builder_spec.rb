require 'rails_helper'

RSpec.describe EntityFormBuilder do
  let(:builder) { EntityFormBuilder.new }
  let(:form) { builder.build }

  before do
    create :condition
  end

  it '#build should return a entity_form instance' do
    expect(form.class).to eq EntityForm
  end

  it '#build should set values for the form' do
    expect(form.statuses.length).to eq 6
  end
end
