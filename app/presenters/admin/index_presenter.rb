class Admin::IndexPresenter < Admin::BasePresenter

  def render_fld(presenter, field, locals = {})
    locals.merge!(field: field)
    @locals = locals
    @presenter = presenter
    field_pth = fld_path(field.to_partial_path)
    fld_presenter.send(field_pth)
  end

  private
    def locals
      @locals
    end

    def presenter
      @presenter
    end

    def fld_presenter
      klass = "Field::IndexPresenter".constantize
      fld_present = klass.new(page, template, @locals)
      fld_present
    end

end
