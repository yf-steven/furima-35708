class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :post_number,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address_number, null: false
      t.string :building_name
      t.string :phone_number,   null: false
      t.references :buy_record, foreign_key: true
      t.timestamps
    end
  end
end
