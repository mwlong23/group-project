class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table(:profiles) do |t|
      t.column(:user_id, :int)
      t.column(:name, :varchar)
      t.column(:birthday, :date)
      t.column(:gender, :varchar)
      t.column(:zip, :int)
      t.column(:photo, :string)
      t.column(:bio, :string)


      t.timestamps()
    end
  end
end
