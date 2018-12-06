class CreateAttendanceentres < ActiveRecord::Migration[5.2]
  def change
    create_table :attendanceentres do |t|
      t.string :user_name
      t.integer :status
      t.string :date
      t.string :area

      t.timestamps
    end
  end
end
