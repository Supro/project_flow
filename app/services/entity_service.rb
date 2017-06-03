class EntityService
  extend Dry::Initializer

  param :params

  option :condition, default: proc { Condition.default }
  option :entity, default: proc { build_entity }
  option :form, default: proc { EntityForm.new(symbolized_params) }
  option :validator, default: proc { EntityValidator.new(permitted_params, periods) }

  def save
    return set_errors unless success?
    build_investment
    entity.save
  end

  delegate :success?, :errors, to: :validator

  private

  def periods
    condition.decorate.periods
  end

  def set_errors
    form.errors = errors
    false
  end

  def permitted_params
    params.require(:entity)
          .permit(:name, :sum, statuses: [])
  end

  def symbolized_params
    permitted_params.to_h.symbolize_keys
  end

  def build_entity
    Entity.new(permitted_params.slice(:name))
  end

  def build_investment
    InvestmentBuilder.new(entity, condition, permitted_params).build
  end
end
