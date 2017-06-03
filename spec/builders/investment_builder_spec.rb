require 'rails_helper'

RSpec.describe InvestmentBuilder do
  let(:entity) { build :entity }
  let(:condition) { build(:condition, term: 11, period: 22, rate: 33, overdue_rate: 44) }
  let(:params) { { sum: 10, statuses: %w(some other) } }

  let(:builder) { InvestmentBuilder.new(entity, condition, params) }
  let(:investment) { builder.build }

  it '#build should return a investment instance' do
    expect(investment.class).to eq Investment

    expect(investment.entity).to be
    expect(investment.condition).to be
  end

  it '#build should set sum' do
    expect(investment.sum).to eq 10.0
  end

  it '#build should build periods for the investment' do
    expect(investment.periods.map(&:status)).to eq %w(some other)
  end

  it '#build should copy fields from a condition to itself' do
    InvestmentBuilder::COPY_FIELDS.each do |field|
      expect(investment.send(field)).to eq condition.send(field)
    end
  end

  context 'calculations' do
    context 'all in_time' do
      let(:condition) { build(:condition) }
      let(:params) { { sum: 1_000_000, statuses: Array.new(6) { 'in_time' } } }

      it '#build should calculate loan_paid' do
        expect(investment.loan_paid).to eq 150_000
      end
    end

    context 'four in_time and others are premature' do
      let(:condition) { build(:condition) }
      let(:params) { { sum: 1_000_000, statuses: Array.new(4) { 'in_time' } + Array.new(2) { 'premature' } } }

      it '#build should calculate loan_paid' do
        expect(investment.loan_paid).to eq 100_000
      end
    end

    context 'two in_time and others are delay' do
      let(:condition) { build(:condition) }
      let(:params) { { sum: 1_000_000, statuses: Array.new(2) { 'in_time' } + Array.new(4) { 'delay' } } }

      it '#build should calculate loan_paid' do
        expect(investment.loan_paid.round(0)).to eq 216_667
      end
    end
  end
end
