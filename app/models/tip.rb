class Tip < ApplicationRecord
  belongs_to :user
  validates :text, length: { maximum: 150 }
end
