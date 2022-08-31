class User < ApplicationRecord
  before_create :set_user_id

# ユーザー名のバリデーション
VALID_NAME_REGEX = /\A[a-zA-Z0-9]+\z/
validates :account_name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 30 },
format: { with: VALID_NAME_REGEX }

# パスワードのバリデーション
has_secure_password
validates :password, presence: true, length: { minimum: 6 }, allow_nil: true



  # ランダムなユーザーIDを生成
  def set_user_id
    while self.id.blank? || User.find_by(id: self.id).present? do
      self.id = SecureRandom.base36
    end
  end

end
