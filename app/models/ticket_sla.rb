class TicketSla < ApplicationRecord
  belongs_to :service_level
  belongs_to :ticket_type
  belongs_to :contact_type
  belongs_to :priority
  belongs_to :user

  geocoded_by :ticket_location

  def self.ticket_location
    [location_city, location_zip].compact.join(', ')
  end
end
