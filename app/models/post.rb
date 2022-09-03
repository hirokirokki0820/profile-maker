class Post < ApplicationRecord
  before_create :set_post_id
  belongs_to :user
  has_many :profiles, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }

  def set_post_id
    while self.id.blank? || Post.find_by(id: self.id).present? do
      self.id = SecureRandom.hex
    end
  end

end
