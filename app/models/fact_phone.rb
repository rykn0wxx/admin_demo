class FactPhone < ApplicationRecord
  belongs_to :dim_time
  belongs_to :project
  belongs_to :language
  belongs_to :timezone

  
end
