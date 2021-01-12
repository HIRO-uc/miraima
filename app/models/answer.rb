class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  with_options presence: true do
    validates :text,  length: { in: 5..1000 }
  end
end
