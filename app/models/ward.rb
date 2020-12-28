class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '北7階病棟' },
    { id: 2, name: '南7階病棟' },
    { id: 3, name: '北8階病棟' },
    { id: 4, name: '南8階病棟' },
    { id: 5, name: '北9階病棟' },
    { id: 6, name: '南9階病棟' }
  ]

  include ActiveHash::Associations
  has_many :users
end