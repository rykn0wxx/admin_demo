class Admin::BasePresenter

  def initialize(page, template)
    @page = page
    @template = template
  end

  def h
    @template
  end

  def page
    @page
  end

  def template
    @template
  end

  def fld_path(fld_partial_path)
    tmp_arr = fld_partial_path.split('/')
    tmp_arr.reverse[1]
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  private

end
