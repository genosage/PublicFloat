class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.decimal :artwork_longtitude
      t.decimal :artwork_latitude
      t.string :title
      t.string :image_url

      t.timestamps null: false
    end
  end
end
