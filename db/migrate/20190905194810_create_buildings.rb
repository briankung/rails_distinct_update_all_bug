class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.text :address
      t.boolean :updated, default: false

      t.timestamps
    end
  end
end
