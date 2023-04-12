class CreateGcards < ActiveRecord::Migration[7.0]
  def change
    create_table :gcards do |t|
      t.string :code
      t.integer :amount
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
