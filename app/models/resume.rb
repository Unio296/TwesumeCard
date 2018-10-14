class Resume < ApplicationRecord
  belongs_to :user                                                              #ユーザに所属する関連付け
  default_scope -> { order(created_at: :desc) }                                 #新しい投稿から表示する順序付け
  validates :user_id, presence: true                                            #user_idの存在性

end
