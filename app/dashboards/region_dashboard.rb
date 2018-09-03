require "administrate/base_dashboard"

class RegionDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    code: Field::String,
    label: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    languages: Field::HasMany,
    projects: Field::HasMany,
    groups: Field::HasMany
  }

  COLLECTION_ATTRIBUTES = [
    :projects,
    :groups,
    :name,
    :code,
    :label
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :code,
    :label,
    :updated_at,
    :projects
  ]

  FORM_ATTRIBUTES = [
    :name,
    :code,
    :label,
  ]

  # Overwrite this method to customize how regions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(region)
    "#{region.name}"
  end
end
