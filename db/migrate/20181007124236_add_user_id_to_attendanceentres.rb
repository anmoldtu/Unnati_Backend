class AddUserIdToAttendanceentres < ActiveRecord::Migration[5.2]
  def change
    add_column :attendanceentres, :user_id, :integer
  end
end
