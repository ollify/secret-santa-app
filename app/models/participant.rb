class Participant < ApplicationRecord
  belongs_to :group
  has_one :participant
end
