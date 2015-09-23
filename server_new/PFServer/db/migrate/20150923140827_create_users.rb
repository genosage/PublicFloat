class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :user_email

      t.timestamps null: false
    end
  end
end
