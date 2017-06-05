require 'feature_helper'

RSpec.feature 'User visits root page' do
  before do
    condition = create :condition

    params_list = [
      { sum: 1_000_000, statuses: Array.new(6) { 'in_time' } },
      { sum: 1_000_000, statuses: Array.new(4) { 'in_time' } + Array.new(2) { 'premature' } },
      { sum: 1_000_000, statuses: Array.new(2) { 'in_time' } + Array.new(4) { 'delay' } }
    ]

    params_list.each do |params|
      entity = build :entity
      InvestmentBuilder.new(entity, condition, params).build
      entity.save
    end
  end

  scenario 'Plays with calculator', js: true do
    visit root_path

    within 'form.form-inline' do
      fill_in 'sum', with: 1_000_000
    end

    expect(page).to have_content('311 111')
    expect(page).to have_content('300 000')
  end
end
