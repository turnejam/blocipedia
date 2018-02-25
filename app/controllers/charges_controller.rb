class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 15_00,
      description: "Blocipedia Premium--#{current_user.email}",
      currency: 'usd'
    )

    if charge.paid
      current_user.premium!
      flash[:notice] = "Thank you for upgrading, #{current_user.email}! You can now create private wikis."
      redirect_to wikis_path
    end

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium - #{current_user.email}",
      amount: 15_00
      }
  end

end
