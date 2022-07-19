class RemoveAreaFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :area, :string
  end
end
