class RemovePrFromItemsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :pr, :string
  end
end
