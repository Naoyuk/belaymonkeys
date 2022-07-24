class AddPicturesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :pictures, :json
  end
end
