class AddisCreditToTransactions < ActiveRecord::Migration[5.1]
  def change
  	add_column :transactions, :is_credit, :string
  end
end
