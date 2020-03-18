# frozen_string_literal: true

# subscription_category class
class SubscriptionCategory < ApplicationRecord
  has_many :subscriptions
end
