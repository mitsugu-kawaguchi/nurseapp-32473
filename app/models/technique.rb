class Technique < ApplicationRecord
  belongs_to :user
  has_many    :completes, dependent: :destroy
  mount_uploader :video, VideoUploader

  with_options presence: true do
    validates :title
    validates :priority_id
    validates :description
    validates :target_on
    validates :completed_on
    validates :video
  end
  validate :start_finish_check
  validate :start_check

  def start_finish_check
    errors.add(:completed_on) if self.target_on > self.completed_on
  end

  def start_check
    errors.add(:target_on) if self.target_on < Time.now
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :priority

  def completed_by?(user)
    completes.where(user_id: user.id).exists?
  end
end
