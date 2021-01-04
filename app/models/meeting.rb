class Meeting < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :start_time
  end
end
