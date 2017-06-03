class InvestmentBuilder
  extend Dry::Initializer

  COPY_FIELDS = %w(term period rate overdue_rate).freeze

  param :entity
  param :condition
  param :params

  option :investment, default: proc { entity.build_investment }

  def build
    set_sum
    set_and_copy_condition
    build_periods
    calculate_payments
    investment
  end

  private

  def set_sum
    investment.sum = params[:sum]
  end

  def set_and_copy_condition
    investment.condition = condition

    COPY_FIELDS.each do |field|
      investment.send("#{field}=", condition.send(field))
    end
  end

  def build_periods
    params[:statuses].each do |status|
      investment.periods.build(status: status)
    end
  end

  def calculate_payments
    Calculator.new(investment).calculate
  end

  class Calculator
    extend Dry::Initializer

    param :investment
    param :periods, default: proc { PeriodsCollection.new(investment.periods.to_a) }

    def calculate
      investment.loan_paid = total_loan
    end

    private

    def total_loan
      (in_time + delay + premature).to_f
    end

    def in_time
      sum * rate / 12 * periods.in_time.length
    end

    def delay
      sum * overdue_rate / 12 * periods.delay.length
    end

    def premature
      sum / investment.term * periods.premature.length
    end

    def rate
      BigDecimal.new(investment.rate) / 100
    end

    def overdue_rate
      BigDecimal.new(investment.overdue_rate) / 100
    end

    def sum
      BigDecimal.new(1) * investment.sum
    end
  end

  class PeriodsCollection
    extend Dry::Initializer

    param :periods

    def in_time
      periods.select { |period| period.status.eql?('in_time') }
    end

    def delay
      periods.select { |period| period.status.eql?('delay') }
    end

    def premature
      periods.select { |period| period.status.eql?('permature') }
    end
  end
end
