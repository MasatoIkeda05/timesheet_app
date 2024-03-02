class ChangeWorkingtimesToTimeSheets < ActiveRecord::Migration[7.1]
  def change
    rename_table :workingtimes, :time_sheets
  end
end
