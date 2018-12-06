class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id,null: false
      t.integer :mod_id,null: false
      t.integer :correctans
      t.integer :wrongans

      t.timestamps
    end
  end
end
