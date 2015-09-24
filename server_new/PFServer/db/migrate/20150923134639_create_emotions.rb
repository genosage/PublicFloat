class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.text :emotion_name
      t.integer :artwork_id

      t.timestamps null: false
    end
  end
end
