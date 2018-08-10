class AddUserIdToMygallery < ActiveRecord::Migration[5.2]
  def change
  	add_column :mygalleries, :user_id, :integer
  end
end
