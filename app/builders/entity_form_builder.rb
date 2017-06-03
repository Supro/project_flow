class EntityFormBuilder
  extend Dry::Initializer

  param :condition, default: proc { Condition.default.decorate }

  def build
    EntityForm.new(name: '', sum: 0, statuses: statuses)
  end

  private

  def statuses
    Array.new(condition.periods) { '' }
  end
end
