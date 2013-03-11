class PonyRide
  include Rails.application.routes.url_helpers
  include FamiliesHelper

  def initialize(subject, template)
    @subject = subject
    @template = template
  end

  def mail(recipient)
    return if recipient.email.blank?

    @family = recipient.family

    path = Rails.root.join("app", "views", "emails", @template + ".haml")
    content = File.open(path).read
    rendered = Haml::Engine.new(content).render(self)

    self.class.send_mail(recipient.email, @subject, rendered)

  end

  def self.send_mail(email, subject, body)
    Pony.mail(
      to: email,
      from: "icambron@gmail.com",
      subject: subject,
      html_body: body,
      via: :smtp,
      via_options: {
        openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
        address: "smtp.sendgrid.com",
        user_name: ENV['WEDDING_SMTP_USERNAME'],
        password: ENV['WEDDING_SMTP_PASSWORD'],
        authentication: :plain,
        port: 587,
        charset: "UTF-8",
        enable_starttls_auto: true
      }
    )
  end
end
