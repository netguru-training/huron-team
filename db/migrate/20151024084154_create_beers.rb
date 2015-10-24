class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :kind
      t.integer :rating

      t.timestamps null: false
    end
  end
end
