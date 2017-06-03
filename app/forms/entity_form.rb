class EntityForm < Dry::Struct
  attribute :name, DryTypes::Coercible::String
  attribute :sum, DryTypes::Coercible::Int
  attribute :statuses, DryTypes::Strict::Array.member(DryTypes::Coercible::String)

  attr_accessor :errors

  def entity
    Entity.new
  end

  def statuses_list
    Period::STATUSES
  end
end
