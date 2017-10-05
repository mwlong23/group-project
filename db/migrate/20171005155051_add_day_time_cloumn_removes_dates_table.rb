class AddDayTimeCloumnRemovesDatesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:dates) do |t|
    end
    add_column :meetups, :day_time, :string

  end
end
