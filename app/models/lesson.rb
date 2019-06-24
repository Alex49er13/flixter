class Lesson < ApplicationRecord
  belongs_to :space
  mount_uploader :video, VideoUploader
end
