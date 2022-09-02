class AddAnswerToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :answer1, :text
    add_column :profiles, :answer2, :text
    add_column :profiles, :answer3, :text
    add_column :profiles, :answer4, :text
    add_column :profiles, :answer5, :text
  end
end
