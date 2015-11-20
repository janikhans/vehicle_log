class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
