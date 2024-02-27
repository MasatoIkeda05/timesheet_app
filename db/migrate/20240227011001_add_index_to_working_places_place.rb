class AddIndexToWorkingPlacesPlace < ActiveRecord::Migration[7.1]
  def change
    add_index :working_places, :place, unique: true
  end
end
