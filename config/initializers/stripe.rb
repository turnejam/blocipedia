# Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_h017l2g62RafkTwsP96puUmg'],
   secret_key: ENV['sk_test_0gnOG4Por6MkChVQrGL2vH9g']
 }

 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]
