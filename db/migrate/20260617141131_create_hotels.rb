class CreateHotels < ActiveRecord::Migration[8.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.text :description
      t.integer :price
      t.string :photo_url

      t.timestamps
    end
  end
end
