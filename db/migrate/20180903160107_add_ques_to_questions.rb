class AddQuesToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :ques, :string
  end
end
