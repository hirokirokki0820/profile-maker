class AddQuestionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :question1, :string
    add_column :posts, :question2, :string
    add_column :posts, :question3, :string
    add_column :posts, :question4, :string
    add_column :posts, :question5, :string
  end
end
