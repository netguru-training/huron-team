class RenameLocalsToBar < ActiveRecord::Migration
  def change
    rename_table :locals, :bars
  end
end
