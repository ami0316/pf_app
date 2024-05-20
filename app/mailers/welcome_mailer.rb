class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_signup.subject
  #
  def send_when_signup(email, last_name, booking)
    @last_name = last_name
    @booking = booking
    mail to: email, subject: 'ご予約が確定しました'
  end
end
