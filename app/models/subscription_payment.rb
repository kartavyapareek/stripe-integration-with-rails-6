# frozen_string_literal: true

# subscription payment class
class SubscriptionPayment < ApplicationRecord
  belongs_to :subscription

  enum status: { pending: 10, hold: 20, paid: 30 }
end
