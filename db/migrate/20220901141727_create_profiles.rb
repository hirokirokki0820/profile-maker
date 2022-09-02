class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.string :birthday
      t.string :blood_type
      t.string :personality
      t.belongs_to :post, foreign_key: :true, type: :string

      t.timestamps
    end
  end
end
