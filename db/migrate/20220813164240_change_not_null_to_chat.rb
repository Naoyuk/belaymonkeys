class ChangeNotNullToChat < ActiveRecord::Migration[7.0]
  def up
    change_column_null :chats, :post_id, true
  end

  def down
    change_column_null :chats, :post_id, false
  end
end
