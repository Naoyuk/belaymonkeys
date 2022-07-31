class CreatePartnerships < ActiveRecord::Migration[7.0]
  def change
    create_table :partnerships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :partner_id
      t.boolean :confirmed, default: :false

      t.timestamps
    end
  end
end
