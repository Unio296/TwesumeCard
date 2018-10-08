class ContactMailer < ActionMailer::Base
  
  default from: "info@twesumecard.herokuapp.com"
  default bcc: "unioblog@gmail.com"

  def received_email(contact)
    @contact = contact
    mail_subject = "TwesumeCard " + @contact.name + "様からのお問い合わせ"
    mail(to: @contact.email, subject: mail_subject)
  end
end