class AddModnameToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :modname, :string
  end
end
