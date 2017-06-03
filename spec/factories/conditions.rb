# == Schema Information
#
# Table name: conditions
#
#  id           :integer          not null, primary key
#  term         :integer          default("0")
#  period       :integer          default("0")
#  rate         :integer          default("0")
#  overdue_rate :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :condition do
    term         6
    period       1
    rate         30
    overdue_rate 50
  end
end
