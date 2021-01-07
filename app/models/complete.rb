class Complete < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :technique, optional: true
end
