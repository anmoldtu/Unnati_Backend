class CreateBios < ActiveRecord::Migration[5.2]
  def change
    create_table :bios do |t|
      t.integer :user_id,null: false
      t.integer :course_id,null: false
      t.string :name,null: false
      t.string :area,null: false

      t.timestamps
    end
  end
end
