class AddOption3hinToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :option3hin, :string
  end
end
