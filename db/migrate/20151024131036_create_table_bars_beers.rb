class CreateTableBarsBeers < ActiveRecord::Migration
  def change
    create_table :bars_beers do |t|
      t.integer :bar_id
      t.integer :beer_id
    end
    add_index :bars_beers, :bar_id
    add_index :bars_beers, :beer_id
  end
end
