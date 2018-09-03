class Field::BasePresenter

  def initialize(page, template, locals, presenter = nil)
    @page = page
    @template = template
    @locals = locals
    @presenter = presenter
  end

  def presenter
    @presenter
  end

  def page
    @page
  end

  def template
    @template
  end

  def locals
    @locals
  end

  def field
    @locals[:field]
  end

  def method_missing(*args, &block)
    template.send(*args, &block)
  end

end
