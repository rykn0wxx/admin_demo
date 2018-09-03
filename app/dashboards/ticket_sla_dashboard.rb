require "administrate/base_dashboard"

class TicketSlaDashboard < BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    start_time: Field::DateTime,
    end_time: Field::DateTime,
    actual_duration: Field::Number,
    business_duration: Field::Number,
    actual_pause: Field::Number,
    business_pause: Field::Number,
    sla_stage: Field::String,
    location_city: Field::String,
    location_zip: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    service_level: Field::BelongsTo,
    ticket_type: Field::BelongsTo,
    contact_type: Field::BelongsTo,
    priority: Field::BelongsTo,
    user: Field::BelongsTo
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :service_level,
    :sla_stage,
    :contact_type,
    :actual_duration,
    :business_duration
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :service_level,
    :ticket_type,
    :contact_type,
    :priority,
    :start_time,
    :end_time,
    :actual_duration,
    :business_duration,
    :actual_pause,
    :business_pause,
    :sla_stage,
    :location_city,
    :location_zip,
    :latitude,
    :longitude
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :service_level,
    :ticket_type,
    :contact_type,
    :priority,
    :user,
    :start_time,
    :end_time,
    :actual_duration,
    :business_duration,
    :actual_pause,
    :business_pause,
    :sla_stage,
    :location_city,
    :location_zip,
    :latitude,
    :longitude,
  ].freeze

  # Overwrite this method to customize how ticket slas are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(ticket_sla)
    "TicketSla ##{ticket_sla.id}"
  end
end
