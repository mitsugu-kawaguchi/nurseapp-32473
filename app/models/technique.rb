class Technique < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :priority_id
    validates :description
    validates :target_at
    validates :completed_at
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :priority
end
