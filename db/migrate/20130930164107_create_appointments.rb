class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :title
      t.datetime :start
      t.datetime :end
      t.text :description

      t.timestamps
    end
  end
end
