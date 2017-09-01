class RemoveIsCreditToTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :iscredit, :boolean
  end
end
