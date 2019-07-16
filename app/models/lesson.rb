class Lesson < ApplicationRecord
  belongs_to :space
  mount_uploader :video, VideoUploader

  include RankedModel
   ranks :row_order, with_same: :space_id 
end
