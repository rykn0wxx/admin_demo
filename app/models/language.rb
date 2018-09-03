class Language < ApplicationRecord
  belongs_to :region
  has_many :fact_phones, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
