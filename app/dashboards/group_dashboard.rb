require "administrate/base_dashboard"

class GroupDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    region: Field::BelongsTo,
    client: Field::BelongsTo,
    dim_desk: Field::BelongsTo
  }

  COLLECTION_ATTRIBUTES = [
    :region,
    :client,
    :dim_desk,
    :name,
    :description,
    :updated_at
  ]

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES

  # Overwrite this method to customize how groups are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(group)
    "#{group.name}"
  end
end
