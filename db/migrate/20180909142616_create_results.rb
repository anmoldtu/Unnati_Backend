class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_id, null: false
      t.integer :mod_id, null: false
      t.string :ans_marked, null:false
      t.integer :question_id, null:false

      t.timestamps
    end
  end
end
