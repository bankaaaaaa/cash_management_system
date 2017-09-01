class AddCreatedByToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :created_by, :string
  end
end
