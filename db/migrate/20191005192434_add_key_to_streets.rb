class AddKeyToStreets < ActiveRecord::Migration[6.0]
  def change
    add_column :streets, :key, :integer
  end
end
