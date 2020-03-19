# frozen_string_literal: true

# subscription controller
class SubscriptionsController < ApplicationController
  def show
    @subscription = Subscription.find params[:id]
  end

  def new
    @subscription = Subscription.new
    @subscription_type = SubscriptionCategory.find params[:subscription_type]
  end

  def create
    subscription_category = SubscriptionCategory.find params[:subscription][:subscription_category]

    subscription = Subscription.new(subscription_category: subscription_category, user: current_user, start_date: Date.today, end_date: Date.today + subscription_category.duration.months, status: 'inactive')
    payment = subscription.build_subscription_payment(amount: subscription_category.price, mode: 'online', status: 'pending')
    subscription.save

    @session = Stripe::Checkout::Session.create(
      customer_email: current_user.email,
      payment_method_types: ['card'],
      line_items: [{
        name: "#{subscription_category.title} Subscription",
        description: "Please pay for your #{subscription_category.title} (#{subscription_category.code}) Subscription.",
        amount: subscription_category.price * 100,
        currency: 'inr',
        quantity: 1
      }],
      success_url: success_subscriptions_url + "?session_id={CHECKOUT_SESSION_ID}&sub_id=#{subscription.id}",
      cancel_url: cancel_subscriptions_url
    )
    respond_to do |format|
      format.js
    end
  end

  def success
    subscription = Subscription.find params[:sub_id]
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    payment_intent = Stripe::PaymentIntent.retrieve(session.payment_intent)
    payment = subscription.subscription_payment
    payment.update_attributes(status: 'paid', stripe_session_id: session.id, stripe_payment_id: payment_intent.id)
    subscription.update_attributes(status: 'active')
  end

  def cancel; end

  def subscription_type_list
    @subscription_types = SubscriptionCategory.all
  end
end
