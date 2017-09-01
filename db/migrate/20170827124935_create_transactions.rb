class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
