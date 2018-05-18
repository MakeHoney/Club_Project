class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :short_desc
      t.text :detail_desc
      t.text :meeting_date
      t.string :contact
      t.string :room_location
      t.integer :isApply
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
