class RemoveNameColFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column(:profiles, :name, :string)
  end
end
