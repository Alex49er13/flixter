class Space < ApplicationRecord
  belongs_to :course
  has_many :lessons
end
