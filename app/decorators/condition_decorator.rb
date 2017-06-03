class ConditionDecorator
  extend Dry::Initializer

  param :condition

  delegate :term, :period, to: :condition

  def periods
    condition.term / condition.period
  end
end
