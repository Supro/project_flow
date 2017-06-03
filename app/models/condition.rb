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

class Condition < ApplicationRecord
  has_many :investments, inverse_of: :condition

  def self.default
    first
  end

  def decorate
    ConditionDecorator.new(self)
  end
end
