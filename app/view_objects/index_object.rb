class IndexObject
  extend Dry::Initializer

  param :condition, default: proc { Condition.default }
  param :investments, default: proc { InvestmentCollection.new(Investment.all) }

  def realisitic_profitability
    calculate_realistic_profitability
  end

  def optimistic_profitability
    condition.rate
  end

  private

  def calculate_realistic_profitability
    (loans / interests / term * 12 * 100).to_f.round(2)
  end

  def interests
    BigDecimal(1) * investments.interests
  end

  def loans
    BigDecimal(1) * investments.loans
  end

  def term
    BigDecimal(1) * investments.term
  end

  class InvestmentCollection
    extend Dry::Initializer

    param :investments

    def term
      investments.sum(&:term) / investments.length
    end

    def interests
      investments.sum(&:sum)
    end

    def loans
      investments.sum(&:loan_paid)
    end
  end
end
