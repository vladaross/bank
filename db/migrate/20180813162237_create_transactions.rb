class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.string :type
      t.decimal :sum

      t.timestamps
    end
  end
end
