class Technique < ApplicationRecord
  belongs_to :user
  mount_uploader :video, VideoUploader

  with_options presence: true do
    validates :title
    validates :priority_id
    validates :description
    validates :target_at
    validates :completed_at
    validates :video
  end
  validate :start_finish_check
  validate :start_check

  def start_finish_check
    errors.add(:completed_at) if self.target_at > self.completed_at
  end

  def start_check
    errors.add(:target_at) if self.target_at < Time.now
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :priority
end
