class Project < ApplicationRecord
  belongs_to :region
  belongs_to :client
  has_many :fact_phones
  validates :name, uniqueness: true, presence: true
end
