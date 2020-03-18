# frozen_string_literal: true

class CreateSubscriptionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_categories do |t|
      t.string :title
      t.string :code, unique: true
      t.integer :price
      t.integer :duration
      t.timestamps
    end
  end
end
