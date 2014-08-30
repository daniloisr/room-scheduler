class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.datetime :init
      t.datetime :finish

      t.timestamps
    end
  end
end
