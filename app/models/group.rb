class Group < ApplicationRecord
  has_many :users
  mount_uploader :photo, PhotoUploader
end
