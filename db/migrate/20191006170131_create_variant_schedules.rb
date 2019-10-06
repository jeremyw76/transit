class CreateVariantSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :variant_schedules do |t|
      t.references :bus_stop, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.string :key
      t.datetime :departure

      t.timestamps
    end
  end
end
