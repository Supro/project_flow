# == Schema Information
#
# Table name: investments
#
#  id            :integer          not null, primary key
#  term          :integer          default("0")
#  period        :integer          default("0")
#  rate          :integer          default("0")
#  overdue_rate  :integer          default("0")
#  sum           :float            default("0.0")
#  interest_paid :float            default("0.0")
#  loan_paid     :float            default("0.0")
#  entity_id     :integer          not null
#  condition_id  :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_investments_on_condition_id  (condition_id)
#  index_investments_on_entity_id     (entity_id)
#

require 'rails_helper'

RSpec.describe Investment, type: :model do
  it 'validations' do
    is_expected.to belong_to(:entity).inverse_of(:investment)
    is_expected.to belong_to(:condition).inverse_of(:investment)

    is_expected.to have_many(:periods).inverse_of(:investment).dependent(:destroy)
  end
end
