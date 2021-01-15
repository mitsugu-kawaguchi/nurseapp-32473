class Meeting < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :start_time
  end
end
