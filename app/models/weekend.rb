class Weekend < ApplicationRecord
  has_many :events, dependent: :destroy
end
