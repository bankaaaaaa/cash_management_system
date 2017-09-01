class AddDocToDocuments < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :documents, :doc
  end
end
