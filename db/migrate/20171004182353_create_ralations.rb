class CreateRalations < ActiveRecord::Migration[5.1]
  def change
    create_table(:meetups_users) do |t|
      t.column(:user_id, :int)
      t.column(:meetup_id, :int)

      t.timestamps()
    end  
  end
end
