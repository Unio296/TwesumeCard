class ContactMailer < ActionMailer::Base
  
  default from: "info@独自ドメイン"
  # default to: "送信先"

  def received_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'お問い合わせありがとうございます。')
  end
end