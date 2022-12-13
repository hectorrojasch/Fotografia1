class Tablero < ApplicationRecord
  belongs_to :user
  belongs_to :photography
end
