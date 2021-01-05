class Type < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ワーカー' },
    { id: 2, name: 'ビギナー' },
  ]

  include ActiveHash::Associations
  has_many :users
end
