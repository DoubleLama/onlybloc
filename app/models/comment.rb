class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :climbing_center

  validates :body, presence: true, allow_blank: false
end
