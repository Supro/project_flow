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

FactoryGirl.define do
  factory :period do
    status 'in_time'
  end
end
