class Profile < ApplicationRecord
  belongs_to :user
  validates :self_introduction, length: { maximum: 200 }
  validates :website,           length: { maximum: 100 }
end
