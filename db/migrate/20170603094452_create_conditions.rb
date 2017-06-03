class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.integer :term, default: 0
      t.integer :period, default: 0
      t.integer :rate, default: 0
      t.integer :overdue_rate, default: 0

      t.timestamps
    end
  end
end
