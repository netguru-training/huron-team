class AddLatLngCityAndStreetToLocal < ActiveRecord::Migration
  def change
    add_column :locals, :lat, :decimal
    add_column :locals, :lng, :decimal
    add_column :locals, :city, :string
    add_column :locals, :street, :string
  end
end
