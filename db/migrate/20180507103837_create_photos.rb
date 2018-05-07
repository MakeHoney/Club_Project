class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :isMain
      t.text :desc
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
