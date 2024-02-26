class CreateWorkingtimes < ActiveRecord::Migration[7.1]
  def change
    create_table :workingtimes do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :working_min #分単位で計測
      t.integer :month
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
