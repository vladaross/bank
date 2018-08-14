class RemoveTypeFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :type, :string
  end
end
