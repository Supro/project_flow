require 'feature_helper'

RSpec.feature 'User visits entity form' do
  before do
    create :condition
  end

  scenario 'Creates a new entity' do
    visit new_entity_path

    within 'form.form-horizontal' do
      fill_in 'entity_name', with: 'Faker::Company.name'
      fill_in 'entity_sum', with: 1000

      find('input[type="submit"]').click
    end

    expect(current_path).to eq(root_path)
  end
end
