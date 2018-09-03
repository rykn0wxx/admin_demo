require "administrate/base_dashboard"

class ClientDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    projects: Field::HasMany,
    groups: Field::HasMany
  }

  COLLECTION_ATTRIBUTES = [
    :projects,
    :name,
    :updated_at
  ]

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
  FORM_ATTRIBUTES = [
    :name,
  ]

  puts Ability
  def display_resource(client)
    "#{client.name}"
  end
end
