class Group < ApplicationRecord
  belongs_to :region
  belongs_to :client
  belongs_to :dim_desk

  has_and_belongs_to_many :users
end
