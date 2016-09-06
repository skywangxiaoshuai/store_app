class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :status
      t.integer :man_type
      t.integer :man_clothing_type
      t.integer :man_shoes_type
      t.integer :women_type
      t.integer :women_clothing_type
      t.integer :women_shoes_type
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
