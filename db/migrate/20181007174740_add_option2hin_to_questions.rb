class AddOption2hinToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :option2hin, :string
  end
end
