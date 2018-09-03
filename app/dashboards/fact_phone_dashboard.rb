require "administrate/base_dashboard"

class FactPhoneDashboard < BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    dim_time: Field::BelongsTo,
    project: Field::BelongsTo,
    language: Field::BelongsTo,
    timezone: Field::BelongsTo,
    id: Field::Number,
    record_date: Field::DateTime,
    calls_off: Field::Number,
    calls_ans: Field::Number,
    calls_wsl: Field::Number,
    calls_abn: Field::Number,
    calls_a30: Field::Number,
    time_talk: Field::Number,
    time_hold: Field::Number,
    time_wrap: Field::Number,
    queue_ans: Field::Number,
    queue_max: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :dim_time,
    :project,
    :language,
    :record_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :dim_time,
    :project,
    :language,
    :timezone,
    :id,
    :record_date,
    :calls_off,
    :calls_ans,
    :calls_wsl,
    :calls_abn,
    :calls_a30,
    :time_talk,
    :time_hold,
    :time_wrap,
    :queue_ans,
    :queue_max,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :dim_time,
    :project,
    :language,
    :timezone,
    :record_date,
    :calls_off,
    :calls_ans,
    :calls_wsl,
    :calls_abn,
    :calls_a30,
    :time_talk,
    :time_hold,
    :time_wrap,
    :queue_ans,
    :queue_max,
  ].freeze

  # Overwrite this method to customize how fact phones are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(fact_phone)
    "#{fact_phone.id}"
  end
end
