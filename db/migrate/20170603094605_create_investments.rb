class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.integer :term, default: 0
      t.integer :period, default: 0
      t.integer :rate, default: 0
      t.integer :overdue_rate, default: 0

      t.float :sum, default: 0
      t.float :interest_paid, default: 0
      t.float :loan_paid, default: 0

      t.references :entity, null: false
      t.references :condition, null: false

      t.timestamps
    end
  end
end
