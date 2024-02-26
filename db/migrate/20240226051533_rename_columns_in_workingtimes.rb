class RenameColumnsInWorkingtimes < ActiveRecord::Migration[7.1]
  def change
    rename_column :workingtimes, :start_time, :check_in
    rename_column :workingtimes, :finish_time, :check_out
    rename_column :workingtimes, :working_time, :work_min
  end
end
