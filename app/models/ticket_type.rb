class TicketType < ApplicationRecord
  has_many :ticket_slas
end
