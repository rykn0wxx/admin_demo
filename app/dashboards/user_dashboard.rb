require "administrate/base_dashboard"

class UserDashboard < BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    name: Field::String,
    username: Field::String,
    snow_user: Field::String,
    phone_user: Field::String,
    quality_user: Field::String,
    isadmin: Field::Boolean,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    groups: Field::HasMany
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :email,
    :username,
    :name,
    :isadmin,
    :groups
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :isadmin,
    :email,
    :name,
    :username,
    :snow_user,
    :phone_user,
    :quality_user,
    :sign_in_count,
    :last_sign_in_ip,
    :updated_at,
    :groups
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :groups,
    :email,
    :name,
    :username,
    :snow_user,
    :phone_user,
    :quality_user
  ]
  FORM_ATTRIBUTES
  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.name}"
  end
end
