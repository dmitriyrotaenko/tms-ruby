class Conversion < ApplicationRecord
  validates :from, uniqueness: { scope: :to }
end
