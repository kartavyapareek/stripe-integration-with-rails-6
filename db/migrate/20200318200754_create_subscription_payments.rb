# frozen_string_literal: true

class CreateSubscriptionPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_payments do |t|
      t.references :subscription
      t.integer :amount
      t.date :end_date
      t.string :mode
      t.integer :status
      t.timestamps
    end
  end
end
