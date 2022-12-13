class Photography < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  has_one_attached :foto
end
