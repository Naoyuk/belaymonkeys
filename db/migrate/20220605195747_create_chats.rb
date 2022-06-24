class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :host_user_id
      t.integer :guest_user_id
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
