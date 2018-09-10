class RemoveQuestionFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :question, :string
  end
end
