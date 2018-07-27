class CreateFrnds < ActiveRecord::Migration[5.2]
  def change
    create_table :frnds do |t|
      t.string :email
      t.string :body
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
