class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.string :status, null: false
      t.references :investment, null: false

      t.timestamps
    end
  end
end
