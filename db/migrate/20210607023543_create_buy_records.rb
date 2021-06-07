class CreateBuyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_records do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
