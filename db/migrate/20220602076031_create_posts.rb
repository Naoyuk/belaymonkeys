# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.timestamp :date
      t.time :start_time
      t.time :end_time
      t.integer :kind_of_climbing
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
