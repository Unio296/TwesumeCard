class User < ApplicationRecord

  has_many :resumes, dependent: :destroy  #userが削除されると所有しているpostsも削除される
  has_many :products, dependent: :destroy  #userが削除されると所有しているpostsも削除される
  
  validates :provider, presence: true
  validates :uid ,presence: true, uniqueness: true
  validates :name, presence: true        #
  validates :nickname, presence: true, uniqueness: true

  #twitter認証
  def self.find_or_create_from_auth(auth)
    
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    nickname = auth[:info][:nickname]
    #image_url = auth[:info][:image]  #httpsの画像を利用するため下記に変更
    image_url = auth[:extra][:raw_info][:profile_image_url_https]
    debugger
    self.find_or_create_by(provider: provider, uid: uid) do |user|

      user.name = name
      unless User.where(nickname: nickname).exists? #登録がなければ
        user.nickname = nickname            #そのまま設定
      else                                  #登録がある場合
        loop do
          user.nickname = SecureRandom.hex(7) #nicknameにランダム文字列
          break unless User.where(nickname: user.nickname).exists?
        end
      end
      user.image_url = image_url
    end
  end

end