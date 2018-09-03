class Region < ApplicationRecord
  has_many :languages
  has_many :projects
  has_many :groups
  validates :name, uniqueness: true, presence: true
  validates :code, presence: true
  validates :label, presence: true
end
