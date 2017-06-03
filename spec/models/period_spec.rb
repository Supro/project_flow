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

require 'rails_helper'

RSpec.describe Period, type: :model do
  it 'validations' do
    is_expected.to belong_to(:investment).inverse_of(:periods)
  end
end
