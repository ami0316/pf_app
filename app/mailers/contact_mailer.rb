class ContactMailer < ApplicationMailer
  def send_mail(params)
    @data = params
    mail to: ENV["GMAIL_ADDRESS"], subject: "【お問い合わせ】"
  end
end
