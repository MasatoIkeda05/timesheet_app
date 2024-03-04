class DropWorkingData < ActiveRecord::Migration[7.1]
  def change
    drop_table :working_data
  end
end
