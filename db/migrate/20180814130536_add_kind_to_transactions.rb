class AddKindToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :kind, :string
  end
end
