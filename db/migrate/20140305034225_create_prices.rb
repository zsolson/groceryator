class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :item_id
      t.decimal :avg, :precision => 6, :scale => 2, :default => 0
      t.decimal :max, :precision => 6, :scale => 2, :default => 0
      t.decimal :min, :precision => 6, :scale => 2, :default => 0
      t.decimal :total, :precision => 6, :scale => 2, :default => 0
      t.integer :count, :default => 0

      t.timestamps
    end
    add_index :prices, :item_id, unique: true
  end
end
