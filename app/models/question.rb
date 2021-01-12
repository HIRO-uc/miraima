class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :user
  has_many :answers
end
