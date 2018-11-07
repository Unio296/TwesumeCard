class ContactController < ApplicationController
  # 不要になった。あとで削除。
  
  #def index
    # 入力画面を表示
  #  @contact = Contact.new
  #end

  #def confirm
    # 入力値のチェック
  #  @contact = Contact.new(contact_params)

  #  unless verify_recaptcha(model: @contact) && @contact.valid?
      # NG。入力画面を再表示
  #    render 'index'
  #  end
  #end

  #def thanks
    # メール送信
  #  @contact = Contact.new(contact_params)
  #  ContactMailer.received_email(@contact).deliver
    
  #end

  #private
    
  #  def contact_params
  #    params.require(:contact).permit(:name, :email, :message)
  #  end
end