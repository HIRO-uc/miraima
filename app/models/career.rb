class Career < ApplicationRecord
  belongs_to :user
  validates :worthwhile,       length: { maximum: 200 }
  validates :ideal_candidate,  length: { maximum: 200 }
  validates :can_do_now,       length: { maximum: 200 }
  validates :recommended_book, length: { maximum: 100 }
end
