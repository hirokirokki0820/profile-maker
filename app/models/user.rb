class User < ApplicationRecord
  attr_accessor :name, :remember_token, :remember_me
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

  # ランダムなremenberトークンを生成
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ハッシュ化した記憶トークンをDB（remember_digest）に保存する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # cookiesから渡されたトークンがダイジェスト(ハッシュ化されたトークン）と一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーの記憶ダイジェストを破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

end
