require "administrate/base_dashboard"

class ServiceLevelDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    definition: Field::Text,
    weighting: Field::Number.with_options(decimals: 2),
    measurement: Field::Text,
    calculation: Field::Text,
    sla_target: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    dim_desk: Field::BelongsTo
  }

  COLLECTION_ATTRIBUTES = [
    :dim_desk,
    :id,
    :name,
    :description,
    :sla_target
  ]

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES

  # Overwrite this method to customize how service levels are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(service_level)
    "#{service_level.name}"
  end
end
