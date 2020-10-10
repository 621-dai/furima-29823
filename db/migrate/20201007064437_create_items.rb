class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                       null: false
      t.text    :introduction,               null: false
      t.integer :price,                      null: false
      t.integer :user_id,                    null: false, foreign_key: true
      t.integer :category_id,                null: false 
      t.integer :condition_id,               null: false
      t.integer :shipping_cost_id,           null: false 
      t.integer :prefecture_id,              null: false 
      t.integer :estimated_shipping_date_id, null: false 

      t.timestamps
    end
  end
end