class AddApplyMethodToClub < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :applyMethod, :string
  end
end
