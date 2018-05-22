class AddImageUrlToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :image_url, :string
  end
end
