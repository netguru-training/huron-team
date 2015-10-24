class CreateLocal < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
    end
  end
end
