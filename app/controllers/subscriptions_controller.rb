# frozen_string_literal: true

# subscription controller
class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    @subscription_type = SubscriptionCategory.find params[:subscription_type]
  end

  def create
    debugger
  end

  def subscription_type_list
    @subscription_types = SubscriptionCategory.all
  end
end
