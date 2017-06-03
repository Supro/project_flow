class RemoveInterestPaidFromInvestments < ActiveRecord::Migration[5.0]
  def change
    remove_column :investments, :interest_paid, :float
  end
end
