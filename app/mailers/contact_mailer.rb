class ContactMailer < ActionMailer::Base
  
  default from: "info@twesumecard"
  default bcc: "unioblog@gmail.com"

  def received_email(contact)
    @contact = contact
    mail_subject = "【TWESUME CARD】お問い合わせ情報確認"
    mail(to: @contact.email, subject: mail_subject)
  end
end