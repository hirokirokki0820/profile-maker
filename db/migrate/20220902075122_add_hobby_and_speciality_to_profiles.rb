class AddHobbyAndSpecialityToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :hobby, :text
    add_column :profiles, :speciality, :text
  end
end
