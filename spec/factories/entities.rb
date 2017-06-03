# == Schema Information
#
# Table name: entities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :entity do
    name Faker::Company.name
  end
end
