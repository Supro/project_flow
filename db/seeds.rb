# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

condition = FactoryGirl.create :condition

params_list = [ 
  { sum: 1_000_000, statuses: 6.times.map{ 'in_time' } },
  { sum: 1_000_000, statuses: 4.times.map{ 'in_time' } + 2.times.map{ 'premature' } },
  { sum: 1_000_000, statuses: 2.times.map{ 'in_time' } + 4.times.map{ 'delay' } }
]

params_list.each do |params|
  entity = FactoryGirl.build :entity
  InvestmentBuilder.new(entity, condition, params).build
  entity.save
end