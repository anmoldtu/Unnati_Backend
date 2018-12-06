class CreateAttendanceadmins < ActiveRecord::Migration[5.2]
  def change
    create_table :attendanceadmins do |t|
      t.string :user_name
      t.integer :status
      t.string :date

      t.timestamps
    end
  end
end
