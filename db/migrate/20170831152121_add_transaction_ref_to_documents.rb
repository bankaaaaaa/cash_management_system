class AddTransactionRefToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_reference :documents, :transaction, foreign_key: true
  end
end
