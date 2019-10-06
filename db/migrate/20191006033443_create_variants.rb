class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :key
      t.string :name
      t.references :bus_route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
