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

class Investment < ApplicationRecord
  belongs_to :entity, inverse_of: :investment
  belongs_to :condition, inverse_of: :investment

  has_many :periods, inverse_of: :investment, dependent: :destroy
end
