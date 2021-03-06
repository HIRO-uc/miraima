class Tip < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :text, length: { maximum: 150 }
  end
end
