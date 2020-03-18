# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :subscription_category
      t.references :user
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.timestamps
    end
  end
end
