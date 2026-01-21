class AddAiAnswerToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :ai_answer, :text
  end
end
