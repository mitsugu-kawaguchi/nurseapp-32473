class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :techniques
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ward

  with_options presence: true do
    validates :name
    validates :nursing_history
    validates :ward_id
  end
end
