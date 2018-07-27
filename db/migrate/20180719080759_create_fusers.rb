class CreateFusers < ActiveRecord::Migration[5.2]
  def change
    create_table :fusers do |t|
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
