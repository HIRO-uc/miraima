class Occupation < ApplicationRecord
  has_many :careers
  has_ancestry
end
