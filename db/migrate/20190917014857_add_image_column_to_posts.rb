class AddImageColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :string, null: false
  end
end
