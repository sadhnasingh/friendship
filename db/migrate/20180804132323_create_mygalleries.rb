class CreateMygalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :mygalleries do |t|
      t.string :image
      t.string :string
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
