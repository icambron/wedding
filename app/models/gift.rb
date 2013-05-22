class Gift < ActiveRecord::Base

  attr_accessor :name, :card_number, :card_code, :card_month, :card_year, :zip, :amount, :stripe_id

  def submit!

    hash = {
      amount: amount.nil? ? 0 : amount.to_i * 100,
      currency: "usd",
      card: {
        name: name,
        number: card_number,
        cvc: card_code,
        address_zip: zip,
        exp_month: card_month,
        exp_year: card_year
      }
    }

    charge = Stripe::Charge.create(hash)

    self.stripe_id = charge.id

  rescue Exception => e
    errors.add :base, e.message
    false
  end


end
