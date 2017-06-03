# == Schema Information
#
# Table name: entities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'validations' do
    is_expected.to have_one(:investment).inverse_of(:entity).dependent(:destroy)
  end
end
