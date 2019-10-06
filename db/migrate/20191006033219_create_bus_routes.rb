class CreateBusRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :bus_routes do |t|
      t.integer :number
      t.string :name
      t.string :customer_type
      t.string :coverage

      t.timestamps
    end
  end
end
