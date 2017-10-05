class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :meetups, :catagory, :category
  end
end
