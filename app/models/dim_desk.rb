class DimDesk < ApplicationRecord
  has_many :groups
  has_many :service_levels
  has_many :users, through: :groups
end
