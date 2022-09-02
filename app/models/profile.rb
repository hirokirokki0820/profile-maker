class Profile < ApplicationRecord
  belongs_to :post

  validates :name, presence: true, length: { maximum: 100 }
  validates :gender, presence: true



end
