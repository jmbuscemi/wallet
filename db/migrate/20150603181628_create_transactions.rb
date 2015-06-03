class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :recipient
      t.string :description
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
