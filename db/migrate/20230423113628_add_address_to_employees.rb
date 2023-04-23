class AddAddressToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :address, :string
  end
end
