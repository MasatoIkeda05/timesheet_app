class CreateWorkingPlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :working_places do |t|
      t.string :place
      t.integer :wage

      t.timestamps
    end
  end
end
