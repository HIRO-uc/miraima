class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :user
  has_many   :answers
  with_options presence: true do
    validates :title, length: { maximum: 100 }
    validates :text,  length: { in: 5..1000 }
  end
end
