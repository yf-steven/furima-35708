class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :text,                 null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :cost_who_id,       null: false
      t.integer :post_from_id,      null: false
      t.integer :days_to_post_id,   null: false
      t.integer :price,             null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
