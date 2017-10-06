class AddLunchAndDinnerOptionsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :lunch, :boolean
    add_column :items, :dinner, :boolean
  end
end
