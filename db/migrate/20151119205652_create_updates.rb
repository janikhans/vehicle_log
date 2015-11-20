class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.date :date
      t.integer :mileage
      t.text :comment
      t.references :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
