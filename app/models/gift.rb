class Gift < ActiveRecord::Base
  include BCrypt

  belongs_to :family

  #transient attributes that we don't save
  attr_accessor :name, :card_number, :card_code, :card_month, :card_year, :zip

  def submit_and_save

    hash = {
      amount: amount.nil? ? 0 : amount * 100,
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

    logger.info hash

    charge = Stripe::Charge.create(hash)

    self.stripe_id = charge.id
    save!

  rescue Exception => e
    errors.add :base, e.message
    false
  end


end
