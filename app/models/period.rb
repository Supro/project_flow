# == Schema Information
#
# Table name: periods
#
#  id            :integer          not null, primary key
#  status        :string           not null
#  investment_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_periods_on_investment_id  (investment_id)
#

class Period < ApplicationRecord
  STATUSES = %w(in_time delay premature).freeze

  belongs_to :investment, inverse_of: :periods
end
