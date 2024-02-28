class AddWorkingNowToWorkingtimes < ActiveRecord::Migration[7.1]
  def change
    add_column :workingtimes, :working_now, :boolean, default: false
  end
end
