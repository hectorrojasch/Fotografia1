class Tag < ApplicationRecord

	has_many :photographies, dependent: :destroy

end
