class RenameColumnsInWorkingtimesV2 < ActiveRecord::Migration[7.1]
  def change
    rename_column :workingtimes, :work_min, :working_min
  end
end
