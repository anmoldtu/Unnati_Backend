class AddFeesToBio < ActiveRecord::Migration[5.2]
  def change
    add_column :bios, :fees, :integer
  end
end
