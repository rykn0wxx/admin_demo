require "administrate/base_dashboard"

class DimDeskDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    label: Field::String,
    support_level: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    groups: Field::HasMany,
    service_levels: Field::HasMany,
    users: Field::HasMany
  }

  COLLECTION_ATTRIBUTES = [
    :groups,
    :users,
    :name,
    :label,
    :service_levels,
    :support_level,
  ]

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES

  # Overwrite this method to customize how dim desks are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(dim_desk)
    "#{dim_desk.name}"
  end
end
