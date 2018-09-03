class Timezone < ApplicationRecord
  has_many :fact_phones

  validates :name, uniqueness: true, presence: true
end
