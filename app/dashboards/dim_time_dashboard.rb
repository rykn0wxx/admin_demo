require "administrate/base_dashboard"

class DimTimeDashboard < BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    fact_phones: Field::HasMany,
    id: Field::Number,
    dt_num: Field::String.with_options(searchable: false),
    dt_time: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :fact_phones,
    :id,
    :dt_num,
    :dt_time,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :fact_phones,
    :id,
    :dt_num,
    :dt_time,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :dt_num,
    :dt_time,
  ].freeze

  # Overwrite this method to customize how dim times are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(dim_time)
    "#{dim_time.id}"
  end
end
