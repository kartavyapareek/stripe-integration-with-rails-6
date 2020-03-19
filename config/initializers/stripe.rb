# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: 'pk_test_SHnKz9wxRmdXjMLhYdVBAANv00THgiNo3L',
  secret_key: 'sk_test_zz2R5b3TmQDocmniS5lnYFHv00tt6aYt2O'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
