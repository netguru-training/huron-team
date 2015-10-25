class AddUserIdToTableBars < ActiveRecord::Migration
  def change
    add_column :bars, :user_id, :string
  end
end
