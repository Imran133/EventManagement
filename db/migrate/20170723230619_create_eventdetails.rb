class CreateEventdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :eventdetails do |t|
      t.string :name
      t.string :venue
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
