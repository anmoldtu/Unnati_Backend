class AddOption1hinToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :option1hin, :string
  end
end
