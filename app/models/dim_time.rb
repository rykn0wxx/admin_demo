class DimTime < ApplicationRecord
  has_many :fact_phones

  validates :dt_num, uniqueness: true, presence: true
end
