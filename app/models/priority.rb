class Priority < ActiveHash::Base
  self.data = [
    { id: 1, name: '1' },
    { id: 2, name: '2' },
    { id: 3, name: '3' }
  ]

  include ActiveHash::Associations
  has_many :techniques
end