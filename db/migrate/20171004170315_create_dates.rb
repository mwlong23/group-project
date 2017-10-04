class CreateDates < ActiveRecord::Migration[5.1]
  def change
    create_table(:dates) do |t|
      t.column(:date, :date)
      t.column(:meetup_id, :int)

      t.timestamps()
    end
  end
end
