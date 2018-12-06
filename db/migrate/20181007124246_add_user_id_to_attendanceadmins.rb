class AddUserIdToAttendanceadmins < ActiveRecord::Migration[5.2]
  def change
    add_column :attendanceadmins, :user_id, :integer
  end
end
