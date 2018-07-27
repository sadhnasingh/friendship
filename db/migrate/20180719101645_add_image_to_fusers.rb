class AddImageToFusers < ActiveRecord::Migration[5.2]
  def change
    add_column :fusers, :image, :string
  end
end
