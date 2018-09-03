class ServiceLevel < ApplicationRecord
  belongs_to :dim_desk
  has_many :ticket_slas
end
