class AddAreaIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :area, null: false, foreign_key: true
  end
end
