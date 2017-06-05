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

  def statuses_normalized
    statuses_list.map do |status|
      [I18n.t("statuses.#{status}"), status]
    end
  end
end
