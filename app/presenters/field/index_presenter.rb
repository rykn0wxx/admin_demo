class Field::IndexPresenter < Field::BasePresenter

  def belongs_to
    if field.data
      link_to field.display_associated_resource, [namespace, field.data]
    else
      field.display_associated_resource
    end
  end

  def boolean
    field.to_s
  end

  def date_time
    field.date if field.data
  end

  def has_many
    pluralize(field.data.size, field.attribute.to_s.humanize.downcase)
  end

  def number
    field.to_s
  end

  def polymorphic
    link_to field.display_associated_resource, [namespace, field.data] if field.data
  end

  def select
    field.data
  end

  def string
    field.truncate
  end

  def text
    field.truncate
  end

end
