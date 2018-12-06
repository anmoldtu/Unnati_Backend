class AddExpirytimeToBio < ActiveRecord::Migration[5.2]
  def change
    add_column :bios, :expirytime, :datetime
  end
end
