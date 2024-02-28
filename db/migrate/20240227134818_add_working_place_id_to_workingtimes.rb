class AddWorkingPlaceIdToWorkingtimes < ActiveRecord::Migration[7.1]
  def change
    add_column :workingtimes, :working_place_id, :integer
  end
end
