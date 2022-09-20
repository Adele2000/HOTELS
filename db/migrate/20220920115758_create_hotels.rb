class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price
      t.integer :room_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
