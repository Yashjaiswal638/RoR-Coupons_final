class AddCountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :count, :integer, null: false, default: 0
  end
end
