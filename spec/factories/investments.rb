# == Schema Information
#
# Table name: investments
#
#  id           :integer          not null, primary key
#  term         :integer          default("0")
#  period       :integer          default("0")
#  rate         :integer          default("0")
#  overdue_rate :integer          default("0")
#  sum          :float            default("0.0")
#  loan_paid    :float            default("0.0")
#  entity_id    :integer          not null
#  condition_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_investments_on_condition_id  (condition_id)
#  index_investments_on_entity_id     (entity_id)
#

FactoryGirl.define do
  factory :investment do
    sum 1_000_000
    interest_paid 150_000
    loan_paid 1_000_000

    entity
    condition

    trait :with_periods do
      after(:create) do |investment|
        investment.condition.term.times do |_|
          investment.periods.create(FactoryGirl.attributes_for(:period))
        end
      end
    end
  end
end
