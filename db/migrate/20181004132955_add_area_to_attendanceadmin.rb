class AddAreaToAttendanceadmin < ActiveRecord::Migration[5.2]
  def change
    add_column :attendanceadmins, :area, :string
  end
end
