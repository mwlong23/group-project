class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table(:meetups) do |t|
      t.column(:name, :varchar)
      t.column(:description, :string)
      t.column(:catagory, :varchar)
      t.column(:street, :varchar)
      t.column(:city, :varchar)
      t.column(:state, :varchar)
      t.column(:zip, :int)

      t.timestamps()
    end
  end
end
