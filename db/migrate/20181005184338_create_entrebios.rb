class CreateEntrebios < ActiveRecord::Migration[5.2]
  def change
    create_table :entrebios do |t|
      t.integer :entre_id,null: false
      t.string :name
      t.string :area
      t.integer :money

      t.timestamps
    end
  end
end
