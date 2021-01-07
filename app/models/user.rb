class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :techniques
  has_many :comments
  has_many :posts, dependent: :destroy
  has_many :completes
  has_many :complete_techniques, through: :completes, source: :technique
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ward

  with_options presence: true do
    validates :name
    validates :nursing_history
    validates :ward_id
  end

  def posts
    return Post.where(user_id: self.id)
  end
end
