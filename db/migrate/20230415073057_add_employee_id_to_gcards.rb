class AddEmployeeIdToGcards < ActiveRecord::Migration[7.0]
  def change
    add_column :gcards, :employee_id, :integer
  end
end
