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

require 'rails_helper'

RSpec.describe Condition, type: :model do
  it 'validations' do
    is_expected.to have_many(:investments).inverse_of(:condition)
  end
end
