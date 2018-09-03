class Client < ApplicationRecord
  has_many :projects
  has_many :groups
  validates :name, uniqueness: true, presence: true
end
