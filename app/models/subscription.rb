# frozen_string_literal: true

# subscription class
class Subscription < ApplicationRecord
  belongs_to :subscription_category
  belongs_to :user
  has_one :subscription_payment

  enum status: { inactive: 10, active: 20, expired: 30 }
end
