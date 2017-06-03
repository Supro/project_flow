# == Schema Information
#
# Table name: entities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entity < ApplicationRecord
  has_one :investment, inverse_of: :entity, dependent: :destroy
end
