class ContactMailer < ActionMailer::Base
  
  default from: "info@twesumecard.herokuapp.com"
  default to: "unioblog@gmail.com"

  def received_email(contact)
    @contact = contact
    mail_subject = "TwesumeCard " + @contact.name + "様からのお問い合わせ"
    mail(subject: mail_subject)
  end
end