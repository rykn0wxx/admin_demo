class Field::ShowPresenter < Field::BasePresenter

  def belongs_to
    if field.data
      if valid_action?(:show, field.attribute)
        link_to field.display_associated_resource, [namespace, field.data]
      else
        field.display_associated_resource
      end
    end
  end

  def boolean
    field.to_s
  end

  def date_time
    field.datetime if field.data
  end

  def has_many
    if field.resources.any?
      render partial: 'admin/application/collection', locals: { :page => field.associated_collection, :resources => field.resources(params[field.name]), :table_title => field.name, :paginate_fld => field }
    else
      content_tag(:span, '-')
    end
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
