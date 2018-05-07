class CreateCategoryClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_clubs do |t|
      t.references :club, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
