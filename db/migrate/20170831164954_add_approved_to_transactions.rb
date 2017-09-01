class AddApprovedToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :approved, :string
  end
end
