# frozen_string_literal: true

class AddStripeIdsToSubscriptionPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :subscription_payments, :stripe_session_id, :string
    add_column :subscription_payments, :stripe_payment_id, :string
  end
end
