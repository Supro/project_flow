require 'rails_helper'

RSpec.describe IndexObject do
  let(:condition) { create :condition }

  let(:view) { IndexObject.new }

  before do
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

  it 'realisitic_profitability' do
    expect(view.realisitic_profitability).to eq 31.11
  end

  it 'optimistic_profitability' do
    expect(view.optimistic_profitability).to eq 30.00
  end
end
