class CreateBusStops < ActiveRecord::Migration[6.0]
  def change
    create_table :bus_stops do |t|
      t.references :street, null: false, foreign_key: true
      t.integer :cross_street_id, null: false, foreign_key: { to_table: :streets }, index: true
      t.integer :number
      t.string :name
      t.string :side
      t.string :direction
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
